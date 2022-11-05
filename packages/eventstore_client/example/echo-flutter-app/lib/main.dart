import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:universal_io/io.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:eventstore_client/eventstore_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Echo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _input = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Use Set to prevent duplicates!
  // ignore: prefer_collection_literals
  final Set<Echo> _messages = LinkedHashSet();
  final _echoController = StreamController();

  late Timer _periodicTimer;
  late EventStoreStreamsClient _client;

  EventStreamSubscription? _subscription;
  LogPosition? _logPosition = LogPosition.start;

  @override
  void initState() {
    super.initState();
    _client = EventStoreStreamsClient(
      // Assumes that an EventStoreDB instance is
      // running locally without security enabled
      EventStoreClientSettings.parse(
        'esdb://${Platform.isAndroid ? '10.0.2.2' : '127.0.0.1'}:5001'
        '?tls=false&operationTimeout=5000',
      ).copyWith(apiVersion: ApiVersions.V21),
    );
    _subscribe();
    _periodicTimer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        if (mounted) {
          _echoController.add('tick');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Send a message',
                      ),
                      autofocus: true,
                      focusNode: _focus,
                      controller: _input,
                      onSubmitted: _echo,
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _input.text.isEmpty ? null : _onPressed,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(52, 52),
                  ),
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: _echoController.stream,
                builder: (context, _) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 32),
                    itemCount: _messages.length,
                    itemBuilder: (context, i) {
                      return _buildMessageTile(i);
                    },
                    controller: _scrollController,
                  );
                }),
          ),
          const SizedBox(height: 58),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildMessageTile(int i) {
    final echo = _messages.elementAt(i);
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 0),
      child: Align(
        alignment: echo.response ? Alignment.topLeft : Alignment.topRight,
        child: Column(
          crossAxisAlignment: echo.response
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                    (echo.response ? Colors.grey.shade200 : Colors.blue[200]),
              ),
              padding: const EdgeInsets.all(14),
              child: SelectableText(
                echo.message,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            SelectableText(
              timeago.format(DateTime.fromMillisecondsSinceEpoch(
                echo.timestamp,
              )),
              style: const TextStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    try {
      final response = await _client.read('chat');
      _messages.clear();
      await for (var event in response.stream) {
        if (!SystemStreams.isSystemStream(event.originalStreamId)) {
          final json = jsonDecode(utf8.decode(event.originalEvent.data));
          _sent(
            event.originalEventId.uuid,
            json['message'],
            json['timestamp'],
          );
          _received(
            event.originalEventId.uuid,
            json['message'],
            json['timestamp'],
          );
          _echoController.add(event);
        }
      }
      setState(() {
        _focus.requestFocus();
      });
      _scrollDown();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _subscribe([LogPosition? position]) async {
    await _refresh();
    final subscription = await _client.subscribeToAll(
      position: position,
      filterOptions: SubscriptionFilterOptions(
        StreamFilter.fromPrefix('chat'),
      ),
      onSubscriptionDropped: (
        EventStreamSubscription _,
        SubscriptionDroppedEvent event,
      ) async {
        if (event.reason != SubscriptionDroppedReason.disposed) {
          await _subscription!.dispose();
          await _subscribe(_logPosition);
        }
      },
    );
    _listen(subscription);
  }

  void _listen(EventStreamSubscription subscription) async {
    if (subscription.isOK) {
      _subscription = subscription;
      try {
        await for (var event in subscription.stream) {
          _logPosition = event.originalPosition;
          final json = jsonDecode(utf8.decode(
            event.originalEvent.data,
          ));
          _messages.add(Echo.sent(
            event.originalEventId.uuid,
            json['message'],
            json['timestamp'],
          ));
          _messages.add(Echo.received(
            event.originalEventId.uuid,
            json['message'],
            json['timestamp'],
          ));
          setState(() {
            _scrollDown();
          });
        }
      } on Exception catch (e) {
        _failure(e.toString());
      }
    }
  }

  void _sent(String uuid, String message, [int? timestamp]) {
    _messages.add(Echo.sent(
      uuid,
      message,
      timestamp,
    ));
  }

  void _received(String uuid, String message, int timestamp) {
    _messages.add(Echo.received(
      uuid,
      message,
      timestamp,
    ));
  }

  void _onPressed() {
    setState(() {
      _echo(_input.text);
    });
  }

  void _echo(String message) async {
    final event = _toEventData(message);
    _sent(event.uuid.uuid, message);
    setState(() {
      _input.clear();
      _focus.requestFocus();
      _scrollDown();
    });
    try {
      final result = await _client.append(
        StreamState.any('chat'),
        Stream.fromIterable([event]),
      );
      if (result.isError) {
        _failure(result);
      }
    } on Exception catch (e) {
      _failure(e);
    }
  }

  EventData _toEventData(String message) => EventData(
      uuid: UuidV4.newUuid().value.uuid,
      type: 'Echo',
      data: utf8.encode(
        jsonEncode({
          'message': message,
          'timestamp': toTimestamp(),
        }),
      ));

  int toTimestamp() => DateTime.now().millisecondsSinceEpoch;

  void _failure(Object error) {
    _received(
      UuidV4.newUuid().value.uuid,
      error.toString(),
      toTimestamp(),
    );
    _scrollDown();
  }

  void _scrollDown() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 2),
      );
    });
  }

  @override
  void dispose() {
    _input.dispose();
    _focus.dispose();
    _periodicTimer.cancel();
    _echoController.close();
    _subscription?.dispose();
    super.dispose();
  }
}

class Echo {
  Echo(this.uuid, this.message, this.timestamp, this.response);

  factory Echo.sent(String uuid, String message, [int? timestamp]) => Echo(
      uuid, message, timestamp ?? DateTime.now().millisecondsSinceEpoch, false);

  factory Echo.received(String uuid, String message, int timestamp) =>
      Echo(uuid, message, timestamp, true);

  final String uuid;
  final int timestamp;
  final bool response;
  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Echo &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          response == other.response;

  @override
  int get hashCode => uuid.hashCode ^ response.hashCode;

  @override
  String toString() {
    return 'Echo{uuid: $uuid, '
        'message: $message, '
        'response: $response, '
        'timestamp: $timestamp}';
  }
}

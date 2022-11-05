import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:universal_io/io.dart';

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

  final List<Echo> _messages = [];

  late EventStoreStreamsClient _client;

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
  }

  @override
  void dispose() {
    _input.dispose();
    _focus.dispose();
    super.dispose();
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
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 32),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                return _buildMessageTile(i);
              },
              controller: _scrollController,
            ),
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
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 0),
      child: Align(
        alignment:
            (_messages[i].response ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (_messages[i].response
                ? Colors.grey.shade200
                : Colors.blue[200]),
          ),
          padding: const EdgeInsets.all(16),
          child: SelectableText(
            _messages[i].message,
            style: const TextStyle(fontSize: 14),
          ),
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
          _add(json['message'], false);
          _add(json['message'], true);
        }
      }
      _scrollDown();
      setState(() {
        _focus.requestFocus();
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _add(String message, bool response) {
    _messages.add(
      Echo(_messages.length, response, message),
    );
  }

  void _onPressed() {
    setState(() {
      _echo(_input.text);
    });
  }

  void _echo(String message) async {
    setState(() {
      _add(message, false);
      _input.clear();
      _focus.requestFocus();
    });
    try {
      final result = await _client.append(
        StreamState.any('chat'),
        Stream.fromIterable([
          EventData(
              uuid: UuidV4.newUuid().value.uuid,
              type: 'Echo',
              data: utf8.encode(
                jsonEncode({
                  'message': message,
                }),
              ))
        ]),
      );
      if (result.isError) {
        _failure(result);
      }
    } on Exception catch (e) {
      _failure(e);
    }
  }

  void _failure(Object error) {
    _add(error.toString(), true);
    _scrollDown();
  }

  // This is what you're looking for!
  void _scrollDown() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 2),
      );
    });
  }
}

class Echo {
  Echo(this.index, this.response, this.message);
  final int index;
  final bool response;
  final String message;
}

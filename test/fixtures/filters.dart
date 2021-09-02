import 'package:eventstore_client/eventstore_client.dart';

class Filters {
  static const List<String> All = [
    StreamNamePrefix,
    StreamNameRegex,
    EventTypePrefix,
    EventTypeRegex,
  ];
  static const String StreamNamePrefix = 'StreamNamePrefix';
  static const String StreamNameRegex = 'StreamNameRegex';
  static const String EventTypePrefix = 'EventTypePrefix';
  static const String EventTypeRegex = 'EventTypeRegex';

  static final Map<String, ReadFilter Function(String)> _filters = {
    StreamNamePrefix: (pattern) => StreamFilter.fromPrefix(pattern),
    StreamNameRegex: (pattern) => StreamFilter.fromRegex(pattern),
    EventTypePrefix: (pattern) => EventTypeFilter.fromPrefix(pattern),
    EventTypeRegex: (pattern) => EventTypeFilter.fromRegex(pattern),
  };

  static ReadFilter parse(String name, String pattern) =>
      _filters[name]!(pattern);

  static Iterable<ReadFilter> all(String pattern) => All.map(
        (name) => parse(name, pattern),
      );
}

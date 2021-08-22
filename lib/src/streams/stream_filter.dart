import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/resolved_event.dart';

/// A structure representing a filter on stream names for read operations.
class StreamFilter extends ReadFilter {
  /// Constructs a new [StreamFilter].
  const StreamFilter({
    int maxSearchWindow = Defaults.MaxSearchWindow,
    List<PrefixFilterExpression> prefixes = const [],
    RegularFilterExpression regex = RegularFilterExpression.None,
  }) : super(prefixes, regex, maxSearchWindow);

  /// An empty [StreamFilter]
  static const StreamFilter None = StreamFilter();

  /// Constructs a new [StreamFilter] from a single prefix [pattern]
  factory StreamFilter.fromPrefix(
    String pattern, [
    int maxSearchWindow = Defaults.MaxSearchWindow,
  ]) {
    if (pattern.isEmpty) {
      throw ArgumentError.value(pattern, 'pattern', 'is empty');
    }
    return StreamFilter(
      maxSearchWindow: maxSearchWindow,
      prefixes: [PrefixFilterExpression.from(pattern)],
    );
  }

  /// Constructs a new [StreamFilter] from a multiple prefixes [pattern]
  factory StreamFilter.fromPrefixes(
    List<String> patterns, [
    int maxSearchWindow = Defaults.MaxSearchWindow,
  ]) {
    if (patterns.any((p) => p.isEmpty)) {
      throw ArgumentError.value(
        patterns,
        'patterns',
        'one or more patterns are empty',
      );
    }
    return StreamFilter(
      maxSearchWindow: maxSearchWindow,
      prefixes: patterns.map((p) => PrefixFilterExpression.from(p)).toList(),
    );
  }

  /// Constructs a new [StreamFilter] from a single regex [pattern]
  factory StreamFilter.fromRegex(
    String pattern, [
    int maxSearchWindow = Defaults.MaxSearchWindow,
  ]) {
    if (pattern.isEmpty) {
      throw ArgumentError.value(pattern, 'pattern', 'is empty');
    }
    return StreamFilter(
      maxSearchWindow: maxSearchWindow,
      regex: RegularFilterExpression.fromPattern(pattern),
    );
  }

  @override
  Iterable<ResolvedEvent> matches(
    Iterable<ResolvedEvent> events, [
    bool any = true,
  ]) {
    final expressions = isRegex
        ? [regex.toExpression()]
        : prefixes.map((e) => e.toExpression());
    return events.where((e) => any
        ? expressions.any((r) => r.hasMatch(
              e.originalStreamId,
            ))
        : expressions.every((r) => r.hasMatch(
              e.originalStreamId,
            )));
  }
}

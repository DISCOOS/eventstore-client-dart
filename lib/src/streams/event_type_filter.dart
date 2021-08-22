import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/resolved_event.dart';

/// A structure representing a filter on event types for read operations.
class EventTypeFilter extends ReadFilter {
  /// Constructs a new [EventTypeFilter].
  const EventTypeFilter({
    int maxSearchWindow = Defaults.MaxSearchWindow,
    List<PrefixFilterExpression> prefixes = const [],
    RegularFilterExpression regex = RegularFilterExpression.None,
  }) : super(prefixes, regex, maxSearchWindow);

  /// An empty [EventTypeFilter]
  static const EventTypeFilter None = EventTypeFilter();

  /// An EventTypeFilter that excludes system events
  /// (i.e., those whose types start with $).
  factory EventTypeFilter.excludeSystemEvents([
    int maxSearchWindow = Defaults.MaxSearchWindow,
  ]) =>
      EventTypeFilter(
        maxSearchWindow: maxSearchWindow,
        regex: RegularFilterExpression.ExcludeSystemEvents,
      );

  /// Constructs a new [EventTypeFilter] from a single prefix [pattern]
  factory EventTypeFilter.fromPrefix(
    String pattern, [
    int maxSearchWindow = Defaults.MaxSearchWindow,
  ]) {
    if (pattern.isEmpty) {
      throw ArgumentError.value(pattern, 'pattern', 'is empty');
    }
    return EventTypeFilter(
      maxSearchWindow: maxSearchWindow,
      prefixes: [PrefixFilterExpression.from(pattern)],
    );
  }

  /// Constructs a new [EventTypeFilter] from a multiple prefixes [pattern]
  factory EventTypeFilter.fromPrefixes(
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
    return EventTypeFilter(
      maxSearchWindow: maxSearchWindow,
      prefixes: patterns.map((p) => PrefixFilterExpression.from(p)).toList(),
    );
  }

  /// Constructs a new [EventTypeFilter] from a single regex [pattern]
  factory EventTypeFilter.fromRegex(
    String pattern, [
    int maxSearchWindow = Defaults.MaxSearchWindow,
  ]) {
    if (pattern.isEmpty) {
      throw ArgumentError.value(pattern, 'pattern', 'is empty');
    }
    return EventTypeFilter(
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
              e.originalEventType,
            ))
        : expressions.every((r) => r.hasMatch(
              e.originalEventType,
            )));
  }
}

import 'package:eventstore_client/src/core/resolved_event.dart';

/// An interface that represents a search filter, used for read operations.
abstract class ReadFilter {
  const ReadFilter(this.prefixes, this.regex, this.maxSearchWindow);

  /// The [PrefixFilterExpression]s associated with this [ReadFilter].
  final List<PrefixFilterExpression> prefixes;

  /// The [RegularFilterExpression] associated with this [ReadFilter].
  final RegularFilterExpression regex;

  /// The maximum number of events to read that do not match the filter
  /// before the operation returns.
  final int? maxSearchWindow;

  /// Check if a Prefix filter
  bool get isPrefix => prefixes.isNotEmpty;

  /// Check if [RegExp] filter
  bool get isRegex => regex != RegularFilterExpression.None;

  /// Filter events using this filter
  Iterable<ResolvedEvent> matches(Iterable<ResolvedEvent> events,
      [bool any = true]);
}

/// A structure representing a prefix (i.e., starts with) filter.
class PrefixFilterExpression {
  /// Constructs a new [PrefixFilterExpression].
  const PrefixFilterExpression._(this.pattern);

  /// An empty [PrefixFilterExpression]
  static const PrefixFilterExpression None = PrefixFilterExpression._('');

  /// Constructs a new [PrefixFilterExpression] from given [pattern]
  factory PrefixFilterExpression.from(String pattern) {
    if (pattern.isEmpty) {
      throw ArgumentError.value(pattern, 'pattern', 'is empty');
    }
    return PrefixFilterExpression._(pattern);
  }

  /// Prefix value
  final String pattern;

  /// Get [RegExp] expression
  RegExp toExpression({
    bool multiLine = false,
    bool caseSensitive = true,
    bool unicode = false,
    bool dotAll = false,
  }) {
    return RegExp(
      pattern,
      caseSensitive: caseSensitive,
      unicode: unicode,
      dotAll: dotAll,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrefixFilterExpression &&
          runtimeType == other.runtimeType &&
          pattern == other.pattern;

  @override
  int get hashCode => pattern.hashCode;

  @override
  String toString() {
    return pattern;
  }
}

/// A structure representing a regular expression filter.
class RegularFilterExpression {
  /// Constructs a new [RegularFilterExpression].
  const RegularFilterExpression._(this.pattern);

  /// An empty [RegularFilterExpression]
  static const RegularFilterExpression None = RegularFilterExpression._('');

  /// A [RegularFilterExpression that excludes system events
  /// (i.e., those whose types start with $).
  static const RegularFilterExpression ExcludeSystemEvents =
      RegularFilterExpression._(r'^[^\$].*');

  /// Constructs a new [RegularFilterExpression] from given [RegExp] pattern
  factory RegularFilterExpression.fromPattern(String pattern) {
    if (pattern.isEmpty) {
      throw ArgumentError.value(pattern, 'pattern', 'is empty');
    }
    return RegularFilterExpression._(pattern);
  }

  /// Constructs a new [RegularFilterExpression] from given [RegExp]
  factory RegularFilterExpression.fromRegexp(RegExp expression) =>
      RegularFilterExpression._(expression.pattern);

  /// Prefix value
  final String pattern;

  /// Get [RegExp] expression
  RegExp toExpression({
    bool multiLine = false,
    bool caseSensitive = true,
    bool unicode = false,
    bool dotAll = false,
  }) {
    return RegExp(
      pattern,
      caseSensitive: caseSensitive,
      unicode: unicode,
      dotAll: dotAll,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrefixFilterExpression &&
          runtimeType == other.runtimeType &&
          pattern == other.pattern;

  @override
  int get hashCode => pattern.hashCode;

  @override
  String toString() {
    return pattern;
  }
}

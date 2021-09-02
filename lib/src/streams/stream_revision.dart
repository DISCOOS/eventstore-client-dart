import 'package:eventstore_client/eventstore_client.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

/// A class referring to the expected stream revision when writing to a stream.
class StreamRevision implements Comparable<StreamRevision> {
  /// Creates a new [StreamRevision] from given [Int64] value
  const StreamRevision._(this.value);

  /// Represents no [StreamRevision], i.e., when a stream does not exist.
  static StreamRevision none = StreamRevision._(Int64(-1));

  /// Represents an empty [StreamRevision], i.e., when a stream exist but contains no events.
  static StreamRevision empty = StreamRevision._(Int64.ZERO);

  /// Creates a new [StreamRevision] from the given [Int64].
  factory StreamRevision.fromInt64(Int64 value) => StreamRevision._(value);

  /// Creates a new [StreamRevision] from the given [StreamPosition].
  factory StreamRevision.fromPosition(StreamPosition position) =>
      StreamRevision._(position.value);

  /// Constructs a new [StreamRevision] from given value.
  factory StreamRevision.checked(int value) {
    if (value == -1) {
      return none;
    }
    final version = Int64(value);
    if (version > Int64.MAX_VALUE && version != Int64.MAX_VALUE) {
      throw ArgumentOutOfRangeException.fromCause(GrpcError.outOfRange(
        'Revision value can not be large than Int64.MAX_VALUE',
      ));
    }
    return StreamRevision._(version);
  }

  /// A [StreamRevision] value
  final Int64 value;

  /// Get value as [int]
  int toInt() => value.toInt();

  /// Get [StreamPosition] from this [StreamRevision]
  StreamPosition toPosition() => StreamPosition.fromRevision(this);

  @override
  int compareTo(StreamRevision other) => other.value.compareTo(value);

  StreamRevision operator -(int delta) =>
      StreamRevision.checked(toInt() - delta);

  StreamRevision operator +(int delta) =>
      StreamRevision.checked(toInt() + delta);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamRevision &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return '$runtimeType{value: $value}';
  }
}

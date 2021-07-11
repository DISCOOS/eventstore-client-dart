import 'package:eventstore_client_dart/src/core/stream_position.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

/// A class referring to the expected stream revision when writing to a stream.
class StreamRevision implements Comparable<StreamRevision> {
  /// Creates a new [StreamRevision] from given [Int64] value
  const StreamRevision._(this.value);

  /// Represents no [StreamRevision], i.e., when a stream does not exist.
  static const StreamRevision none = StreamRevision._(Int64.MAX_VALUE);

  /// Represents an empty [StreamRevision], i.e., when a stream exist but contains no events.
  static const StreamRevision empty = StreamRevision._(Int64.ZERO);

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
      throw GrpcError.outOfRange(
        'Revision value can not be large than Int64.MAX_VALUE',
      );
    }
    return StreamRevision._(version);
  }

  /// A [StreamRevision] value
  final Int64 value;

  @override
  int compareTo(StreamRevision other) => other.value.compareTo(value);

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

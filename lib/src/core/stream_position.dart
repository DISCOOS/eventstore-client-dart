import 'dart:core';

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/stream_revision.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

/// A class referring to an [EventRecord]'s position within a stream.
class StreamPosition {
  /// Constructs a new [StreamPosition].
  const StreamPosition._(this.value);

  /// The beginning (i.e., the first event) of a stream.
  static StreamPosition start = StreamPosition._(Int64.ZERO);

  /// The end of a stream. Use this when reading a stream backwards,
  /// or subscribing live to a stream.
  static StreamPosition end = StreamPosition._(Int64(-1));

  /// Creates a [StreamPosition] from a [StreamRevision].
  factory StreamPosition.fromRevision(StreamRevision revision) {
    return StreamPosition._(revision.value);
  }

  /// Creates a [StreamPosition] from a [Int64].
  factory StreamPosition.fromInt64(Int64 value) {
    if (value == Int64.ZERO) {
      return start;
    }
    return value.toInt() == -1 ? end : StreamPosition._(value);
  }

  /// Constructs a new [StreamPosition] from given value.
  factory StreamPosition.checked(int value) {
    if (value == -1) {
      return end;
    }
    final version = Int64(value);
    if (version > Int64.MAX_VALUE && version != Int64.MAX_VALUE) {
      throw GrpcError.outOfRange(
        'Revision value can not be large than Int64.MAX_VALUE',
      );
    }
    return StreamPosition._(version);
  }

  /// The commit position of the record
  final Int64 value;

  /// Get value as [int]
  int toInt() => value.toInt();

  /// Get [StreamRevision] from this [StreamPosition]
  StreamRevision toRevision() => StreamRevision.fromPosition(this);

  /// Compares whether this &lt; p2.
  bool operator <(StreamPosition p2) => value < p2.value;

  /// Compares whether this &gt; p2.
  bool operator >(StreamPosition p2) => value > p2.value;

  /// Compares whether this &gt;= p2.
  bool operator >=(StreamPosition p2) => this > p2 || this == p2;

  /// Compares whether this &lt;= p2.
  bool operator <=(StreamPosition p2) => this < p2 || this == p2;

  StreamPosition operator -(int delta) =>
      StreamPosition.checked(toInt() - delta);

  StreamPosition operator +(int delta) =>
      StreamPosition.checked(toInt() + delta);

  /// Compare this to other [StreamPosition]
  int compareTo(StreamPosition other) => this == other
      ? 0
      : this > other
          ? 1
          : -1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreamPosition &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'StreamPosition{value: $value}';
  }
}

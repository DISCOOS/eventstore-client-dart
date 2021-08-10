import 'package:collection/collection.dart';
import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/stream_position.dart';
import 'package:eventstore_client_dart/src/core/typedefs.dart';
import 'package:grpc/grpc.dart';

import 'stream_acl.dart';

/// A structure representing a stream's custom metadata with strongly typed properties
/// for system values and a dictionary-like interface for custom values.
class StreamMetadata {
  /// The optional maximum age of events allowed in the stream.
  final Duration? maxAge;

  /// The optional [StreamPosition] from which previous events can be scavenged.
  /// This is used to implement soft-deletion of streams.
  final StreamPosition? truncateBefore;

  /// The optional amount of time for which the stream head is cacheable.
  final Duration? cacheControl;

  /// The optional [StreamAcl] for the stream.
  final StreamAcl? acl;

  /// The optional maximum number of events allowed in the stream.
  final int? maxCount;

  /// The optional [JsonDocument] of user provided metadata.
  final JsonDocument? custom;

  StreamMetadata({
    this.acl,
    this.custom,
    this.maxAge,
    this.maxCount,
    this.cacheControl,
    this.truncateBefore,
  }) {
    if (maxCount != null && maxCount! <= 0) {
      throw GrpcError.outOfRange(
        'maxCount value must be larger than zero',
      );
    }

    if (maxAge != null && maxAge! <= Duration.zero) {
      throw GrpcError.outOfRange(
        'maxAge value must be larger than zero',
      );
    }

    if (cacheControl != null && cacheControl! <= Duration.zero) {
      throw GrpcError.outOfRange(
        'cacheControl value must be larger than zero',
      );
    }
  }

  JsonDocument toJson() => <String, dynamic>{
        if (maxAge != null) SystemMetadata.MaxAge: maxAge!.inSeconds,
        if (maxCount != null) SystemMetadata.MaxCount: maxCount,
        if (cacheControl != null)
          SystemMetadata.CacheControl: cacheControl!.inSeconds,
        if (truncateBefore != null)
          SystemMetadata.TruncateBefore:
              // Must be parsed as unsigned to match charp ulong
              // range 0 to 18,446,744,073,709,551,615, where upper
              // bound codifies end, which signed equals to -1
              truncateBefore!.value.toStringUnsigned(),
        if (custom != null) ...custom,
        if (acl != null) SystemMetadata.Acl: acl!.toJson(),
      };

  @override
  bool operator ==(Object other) {
    final eq = MapEquality<String, dynamic>().equals;
    return identical(this, other) ||
        other is StreamMetadata &&
            runtimeType == other.runtimeType &&
            maxAge == other.maxAge &&
            truncateBefore == other.truncateBefore &&
            cacheControl == other.cacheControl &&
            acl == other.acl &&
            maxCount == other.maxCount &&
            eq(
              custom as Map<String, dynamic>,
              other.custom as Map<String, dynamic>,
            );
  }

  @override
  int get hashCode =>
      maxAge.hashCode ^
      truncateBefore.hashCode ^
      cacheControl.hashCode ^
      acl.hashCode ^
      maxCount.hashCode ^
      custom.hashCode;

  @override
  String toString() {
    return 'StreamMetadata{maxAge: $maxAge, truncateBefore: $truncateBefore, '
        'cacheControl: $cacheControl, acl: $acl, maxCount: $maxCount, '
        'custom: $custom}';
  }
}

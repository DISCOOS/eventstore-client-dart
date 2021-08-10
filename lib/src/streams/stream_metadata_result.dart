import 'dart:convert';

import 'package:eventstore_client_dart/eventstore_client_dart.dart';
import 'package:eventstore_client_dart/src/core/helpers.dart';
import 'package:eventstore_client_dart/src/core/resolved_event.dart';
import 'package:eventstore_client_dart/src/core/stream_position.dart';
import 'package:eventstore_client_dart/src/core/stream_state.dart';
import 'package:eventstore_client_dart/src/generated/streams.pbgrpc.dart';
import 'package:eventstore_client_dart/src/streams/read_results.dart';
import 'package:eventstore_client_dart/src/streams/stream_acl.dart';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';

import 'stream_metadata.dart';

/// Represents stream metadata as a series of properties for system
/// data (e.g., MaxAge) and a [StreamMetadata] object for user metadata.
class StreamMetadataResult {
  StreamMetadataResult._({
    required this.state,
    required this.streamName,
    this.metadata,
    this.streamDeleted = false,
    this.metadataStreamPosition,
  });

  /// The [StreamState] after the operation.
  final ReadState state;

  /// Check if read result is OK
  bool get isOK => state == ReadState.ok;

  /// Check if stream was not found
  bool get isStreamNotFound => state == ReadState.stream_not_found;

  /// The name of the stream.
  final String streamName;

  /// True if the stream is deleted.
  final bool streamDeleted;

  /// A [StreamMetadata] containing user-specified metadata.
  final StreamMetadata? metadata;

  /// A [StreamPosition] of the version of the metadata.
  final StreamPosition? metadataStreamPosition;

  static Future<StreamMetadataResult> from(
    String name,
    ResponseStream<ReadResp> resultStream,
  ) async {
    final result = await resultStream.toList();
    if (result.isEmpty) {
      return StreamMetadataResult._(
        streamName: name,
        state: ReadState.ok,
        metadataStreamPosition: StreamPosition.start,
      );
    }
    final resp = result.last;
    switch (resp.whichContent()) {
      case ReadResp_Content.event:
        final event = ReadEventsResult.convertToResolvedEvent(resp.event);
        return StreamMetadataResult._(
          streamName: name,
          state: ReadState.ok,
          metadata: convertToMetadata(event),
          metadataStreamPosition: event.originalEventNumber,
        );
      case ReadResp_Content.streamNotFound:
        return StreamMetadataResult._(
          streamName:
              utf8.decode(resp.streamNotFound.streamIdentifier.streamName),
          state: ReadState.stream_not_found,
        );
      case ReadResp_Content.confirmation:
      case ReadResp_Content.checkpoint:
      case ReadResp_Content.notSet:
      default:
        throw UnsupportedError('ReadResp $result is unsupported');
    }
  }

  static StreamMetadata convertToMetadata(ResolvedEvent event) {
    final metadata = json.decode(utf8.decode(
      event.event.data,
    )) as Map<String, dynamic>;

    return StreamMetadata(
      acl: metadata.mapAt<StreamAcl>(
        SystemMetadata.Acl,
        (dynamic value) {
          final acl = value as Map<String, dynamic>;
          return StreamAcl(
            readRoles: toRoles(SystemMetadata.AclRead, acl),
            writeRoles: toRoles(SystemMetadata.AclWrite, acl),
            deleteRoles: toRoles(SystemMetadata.AclDelete, acl),
            metaReadRoles: toRoles(SystemMetadata.AclMetaRead, acl),
            metaWriteRoles: toRoles(SystemMetadata.AclMetaWrite, acl),
          );
        },
      ),
      maxCount: metadata.mapAt<int>(
        SystemMetadata.MaxCount,
        (dynamic value) => Int64.parseInt(value.toString()).toInt(),
      ),
      maxAge: metadata.mapAt<Duration>(
        SystemMetadata.MaxAge,
        (dynamic value) => Duration(
          seconds: Int64.parseInt(value.toString()).toInt(),
        ),
      ),
      cacheControl: metadata.mapAt<Duration>(
        SystemMetadata.CacheControl,
        (dynamic value) => Duration(
          seconds: Int64.parseInt(value.toString()).toInt(),
        ),
      ),
      truncateBefore: metadata.mapAt<StreamPosition>(
        SystemMetadata.TruncateBefore,
        (dynamic value) => StreamPosition.fromInt64(Int64.parseInt(
          value.toString(),
        )),
      ),
      custom: metadata
        ..removeWhere((key, dynamic _) => SystemMetadata.fields.contains(key)),
    );
  }

  static List<String>? toRoles(
    String field,
    Map<String, dynamic> acl,
  ) {
    return acl.mapAt<List<String>>(
      field,
      (dynamic value) => List<String>.from(value as List),
    );
  }
}

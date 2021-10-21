part of 'streams_client.dart';

/// Represents stream metadata as a series of properties for system
/// data (e.g., MaxAge) and a [StreamMetadata] object for user metadata.
class StreamMetadataResult {
  StreamMetadataResult._({
    required this.state,
    required this.streamId,
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
  final String streamId;

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
        streamId: name,
        state: ReadState.ok,
        metadataStreamPosition: StreamPosition.start,
      );
    }
    final resp = result.last;
    switch (resp.whichContent()) {
      case ReadResp_Content.event:
        final event = convertToResolvedEvent(
          resp.event,
        );
        return StreamMetadataResult._(
          streamId: name,
          state: ReadState.ok,
          metadata: convertToMetadata(event),
          metadataStreamPosition: event.originalEventNumber,
        );
      case ReadResp_Content.streamNotFound:
        return StreamMetadataResult._(
          streamId: utf8.decode(resp.streamNotFound.streamIdentifier.streamId),
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

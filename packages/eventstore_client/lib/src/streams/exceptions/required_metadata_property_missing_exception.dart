import 'package:eventstore_client/src/core/constants.dart';
import 'package:grpc/grpc.dart';

/// Exception thrown when a required metadata property is missing.
class RequiredMetadataPropertyMissingException implements Exception {
  /// Constructs a new instance of [RequiredMetadataPropertyMissingException].
  RequiredMetadataPropertyMissingException(
    this.missingMetadataProperty, {
    this.cause,
  });

  /// The name of the missing metadata property
  String missingMetadataProperty;

  /// If available, the [cause] of this exception.
  final Object? cause;

  /// Get error message
  String get message =>
      'Required metadata property $missingMetadataProperty is missing.';

  /// Constructs a new instance of [RequiredMetadataPropertyMissingException]
  /// from given [error]
  factory RequiredMetadataPropertyMissingException.fromError(GrpcError error) =>
      RequiredMetadataPropertyMissingException(
        error.trailers![Exceptions.MissingRequiredMetadataProperty] ??
            '<unknown>',
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, cause: $cause}';
  }
}

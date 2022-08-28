import 'package:eventstore_client/src/core/features.dart';
import 'package:grpc/grpc.dart';

/// Exception thrown when a feature is invoked on a [ApiVersion] it
/// does not support.
class FeatureNotSupportedException implements Exception {
  /// Constructs a new instance of [AccessDeniedException] from given [cause]
  FeatureNotSupportedException(this.feature, this.apiVersion, {this.cause})
      : message = "Feature '${feature.name}' not supported. "
            "Version '$apiVersion' does not match "
            "constraint ${feature.constraint}";

  final String message;
  final String apiVersion;
  final ApiFeature feature;
  final GrpcError? cause;

  @override
  String toString() {
    return '$runtimeType{'
        'message: $message, '
        'feature: $feature, '
        'apiVersion: $apiVersion, '
        'cause: $cause}';
  }
}

import 'package:grpc/grpc.dart';

/// Exception thrown when TLS certificate verification failed
class CertificateVerifyFailed implements Exception {
  /// Constructs a new instance of [CertificateVerifyFailed] from given [cause]
  CertificateVerifyFailed(this.message, {this.cause});

  final dynamic message;
  final GrpcError? cause;

  /// Constructs a new instance of [CertificateVerifyFailed] from given [error]
  factory CertificateVerifyFailed.fromCause(GrpcError error) =>
      CertificateVerifyFailed(
        error.message,
        cause: error,
      );

  @override
  String toString() {
    return '$runtimeType{message: $message, error: $cause}';
  }
}

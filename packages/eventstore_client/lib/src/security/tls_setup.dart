import 'package:eventstore_client/eventstore_client.dart';

class TlsSetup {
  /// Default constructor
  const TlsSetup({
    required this.verifyCert,
    this.onBadCertificate,
    this.publicKeyPath,
    this.certificates,
  });

  /// Create a [TlsSetup] with configurable server certificate verification
  static TlsSetup allowBadCertificate(
    bool yes, {
    String? publicKeyPath,
    List<int>? certificates,
  }) =>
      TlsSetup(
        verifyCert: !yes,
        publicKeyPath: publicKeyPath,
        onBadCertificate: (___, __, _) => yes,
      );

  /// Disables server certificate validation. DO NOT USE IN PRODUCTION!
  final bool verifyCert;

  /// Path to the Certificate Authority (CA) signed certificate
  /// (public key) used by each EventStoreDB node for secure
  /// communication (TLS). If not given, the default trust store is
  /// used  instead.
  final String? publicKeyPath;

  final List<int>? certificates;

  /// Handler for checking certificates that fail validation. If this handler
  /// returns `true`, the bad certificate is allowed, and the TLS handshake can
  /// continue. If the handler returns `false`, the TLS handshake fails, and the
  /// connection is aborted. This setting is only used if [useTls] is enabled
  /// (value is true). The method [allowBadCertificate] uses [onBadCertificate]
  /// to implement server certificate verification.
  final BadCertificateHandler? onBadCertificate;

  /// Copy [TlsSetup] and overwrite given values
  TlsSetup copyWith({
    bool? verifyCert,
    String? publicKeyPath,
    List<int>? certificates,
    BadCertificateHandler? onBadCertificate,
  }) {
    return TlsSetup(
      verifyCert: verifyCert ?? this.verifyCert,
      certificates: certificates ?? this.certificates,
      publicKeyPath: publicKeyPath ?? this.publicKeyPath,
      onBadCertificate: onBadCertificate ?? this.onBadCertificate,
    );
  }
}

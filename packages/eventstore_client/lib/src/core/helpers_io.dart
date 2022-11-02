import 'package:eventstore_client/eventstore_client.dart';
import 'package:grpc/grpc.dart' show ChannelCredentials;
import 'package:universal_io/io.dart';

/// Create HttpClient on platforms that supports dart:io
HttpClient toHttpClient(
  EventStoreClientSettings settings,
  ChannelCredentials channelCredentials,
) {
  final client = settings.useTls
      ? HttpClient(context: _toSecurityContext(settings))
      : HttpClient();

  if (settings.tlsSetup.verifyCert) {
    if (channelCredentials.onBadCertificate != null) {
      client.badCertificateCallback = (X509Certificate cert, String host, _) {
        return channelCredentials.onBadCertificate!(cert, host);
      };
    } else if (settings.tlsSetup.onBadCertificate != null) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, port) {
        return settings.tlsSetup.onBadCertificate!(cert, host, port);
      };
    }
  } else {
    client.badCertificateCallback = TlsSetup.allowBadCertificate(
      true,
    ).onBadCertificate;
  }
  return client;
}

SecurityContext _toSecurityContext(EventStoreClientSettings settings) {
  final certs = readHostCertificate(settings);
  if (certs?.isEmpty == true) {
    return SecurityContext.defaultContext;
  }
  return SecurityContext(withTrustedRoots: false)
    ..setTrustedCertificatesBytes(
      certs!,
    );
}

/// Create TLS certificates from [TlsSetup.publicKeyPath]
/// and [TlsSetup.certificates]. Return [null] if none of
/// these are provided.
List<int>? readHostCertificate(EventStoreClientSettings settings) {
  final certificates = <int>[];

  // Add certs from local file?
  if (settings.tlsSetup.publicKeyPath?.isNotEmpty == true) {
    final file = File(settings.tlsSetup.publicKeyPath!);
    if (!file.existsSync()) {
      throw HostCertificateNotFound(file.absolute.path);
    }
    certificates.addAll(file.readAsBytesSync().toList());
  }

  // Add certs from settings as list of ints?
  if (settings.tlsSetup.certificates?.isNotEmpty == true) {
    certificates.addAll(settings.tlsSetup.certificates!);
  }

  return certificates.isNotEmpty ? certificates : null;
}

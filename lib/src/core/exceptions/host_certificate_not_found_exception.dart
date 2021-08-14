class HostCertificateNotFound implements Exception {
  HostCertificateNotFound(this.hostCertificatePath)
      : message = "Host certificate file '$hostCertificatePath' not found";

  final String message;
  final String hostCertificatePath;

  @override
  String toString() {
    return '$runtimeType{message: $message}';
  }
}

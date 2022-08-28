import 'package:eventstore_client/eventstore_client.dart';
import 'package:pub_semver/pub_semver.dart';

/// Class that defines EventStore gRPC client features
/// by [ApiVersion] as semantic version [constraint].
class ApiFeature {
  const ApiFeature(this.name, this.constraint);

  // ----------------------------------
  // Features introduced >= 21.x
  // ----------------------------------
  static const All = [
    BatchAppend,
    BatchAppendDeadline,
    PersistentSubscriptionOnAllStream,
  ];

  static const BatchAppend = ApiFeature(
    'BatchAppend',
    '>=${ApiVersions.V21}',
  );

  static const BatchAppendDeadline = ApiFeature(
    'BatchAppend_Deadline',
    '>=${ApiVersions.V21_10_0}',
  );

  static const PersistentSubscriptionOnAllStream = ApiFeature(
    'PersistentSubscriptionOnAllStream',
    '>=${ApiVersions.V21}',
  );

  /// Name of feature
  final String name;

  /// Api version which support it
  final String constraint;

  /// Get all features supported by given [version]
  Iterable<ApiFeature> isSupported(String version) =>
      All.where((v) => v.allows(version));

  /// Returns `true` if this constraint allows [version].
  bool allows(String version) {
    return VersionConstraint.parse(
      constraint,
    ).allows(Version.parse(
      version,
    ));
  }
}

import 'package:eventstore_client/eventstore_client.dart';
import 'package:eventstore_client/src/core/helpers.dart';
import 'package:uuid/uuid.dart';

class MemberInfo {
  MemberInfo({
    required this.uuid,
    required this.state,
    required this.isAlive,
    required this.endPoint,
    this.features = const [],
    this.apiVersion = 'unknown',
  });

  final bool isAlive;
  final UuidValue uuid;
  final VNodeState state;
  final EndPoint endPoint;
  final String apiVersion;
  final List<ApiFeature> features;

  MemberInfo cloneWith({
    bool? isAlive,
    UuidValue? uuid,
    VNodeState? state,
    EndPoint? endPoint,
    String? apiVersion,
    List<ApiFeature>? features,
  }) =>
      MemberInfo(
        uuid: uuid ?? this.uuid,
        state: state ?? this.state,
        isAlive: isAlive ?? this.isAlive,
        endPoint: endPoint ?? this.endPoint,
        features: features ?? this.features,
        apiVersion: apiVersion ?? this.apiVersion,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberInfo &&
          runtimeType == other.runtimeType &&
          isAlive == other.isAlive &&
          uuid == other.uuid &&
          state == other.state &&
          endPoint == other.endPoint &&
          apiVersion == other.apiVersion &&
          features == other.features;

  @override
  int get hashCode =>
      isAlive.hashCode ^
      uuid.hashCode ^
      state.hashCode ^
      endPoint.hashCode ^
      apiVersion.hashCode ^
      features.hashCode;

  @override
  String toString() {
    return '$runtimeType{'
        'uuid: $uuid, '
        'isAlive: $isAlive, '
        'state: ${enumName(state)}, '
        'endPoint: $endPoint, '
        'apiVersion: $apiVersion, '
        'features: $features}';
  }
}

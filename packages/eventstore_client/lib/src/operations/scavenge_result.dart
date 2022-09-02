import 'package:eventstore_client/src/generated/Operations.pbgrpc.dart';

class ScavengeResult {
  ScavengeResult._(
    this.scavengeId,
    this.state,
  );

  final String scavengeId;
  final ScavengeState state;

  factory ScavengeResult.from(ScavengeResp resp) {
    return ScavengeResult._(
      resp.scavengeId,
      ScavengeState.values[resp.scavengeResult.value],
    );
  }
}

enum ScavengeState {
  Started,
  InProgress,
  Stopped,
}

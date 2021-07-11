import 'package:eventstore_client_dart/src/core/exceptions/exceptions.dart';
import 'package:eventstore_client_dart/src/core/typedefs.dart';
import 'package:eventstore_client_dart/src/generated/cluster.pb.dart';
import 'package:grpc/grpc.dart';

class ReportLeaderInterceptor extends ClientInterceptor {
  ReportLeaderInterceptor(
    ValueSetter<EndPoint> onNewLeader,
  ) : _onNewLeader = onNewLeader;
  final ValueSetter<EndPoint> _onNewLeader;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final call = invoker(
      method,
      request,
      options,
    )..catchError(checkNewLeader);
    return call;
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final call = invoker(
      method,
      requests,
      options,
    )..handleError(checkNewLeader);
    return call;
  }

  void checkNewLeader(Object error) {
    if (error is NotLeaderException) {
      _onNewLeader(error.leader);
    }
  }
}

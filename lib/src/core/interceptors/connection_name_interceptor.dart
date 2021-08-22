import 'package:eventstore_client/src/core/constants.dart';
import 'package:grpc/grpc.dart';

class ConnectionNameInterceptor extends ClientInterceptor {
  ConnectionNameInterceptor(this.name);
  final String name;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return invoker(method, request, _addName(options));
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    return invoker(method, requests, _addName(options));
  }

  CallOptions _addName(CallOptions options) => options
    ..mergedWith(CallOptions(metadata: {
      Headers.ConnectionName: name,
    }));
}

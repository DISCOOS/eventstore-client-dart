import 'dart:async';

import 'package:eventstore_client/src/core/helpers.dart';
import 'package:grpc/grpc.dart';

class ClientRequestInterceptor extends ClientInterceptor {
  ClientRequestInterceptor();
  T? request<T>() => _requests[typeOf<T>()] as T;
  final Map<Type, Object> _requests = {};

  void remote<T>() => _requests.remove(typeOf<T>());

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    _requests[request.runtimeType] = request as Object;
    return invoker(method, request, options);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    return invoker(method, requests.map((request) {
      _requests[request.runtimeType] = request as Object;
      return request;
    }), options);
  }
}

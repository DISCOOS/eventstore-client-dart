import 'package:grpc/grpc.dart';

import 'package:eventstore_client_dart/src/core/constants.dart';
import 'package:eventstore_client_dart/src/core/exceptions/exceptions.dart';
import 'package:eventstore_client_dart/src/core/typedefs.dart';

class TypedExceptionInterceptor extends ClientInterceptor {
  TypedExceptionInterceptor({
    ValueSetter<Exception>? onError,
    Map<String, GrpcErrorCallback> map = const {},
  })  : _onError = onError,
        _map = {...DefaultExceptionMap, ...map};

  static final Map<String, GrpcErrorCallback> DefaultExceptionMap =
      Map.unmodifiable(<String, GrpcErrorCallback>{
    Exceptions.NotLeader: (error) => NotLeaderException.from(error),
    Exceptions.AccessDenied: (error) => AccessDeniedException.from(error),
  });

  final ValueSetter<Exception>? _onError;
  final Map<String, GrpcErrorCallback> _map;

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return invoker(
      method,
      request,
      options,
    )..catchError(_toTypedException);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    return invoker(
      method,
      requests,
      options,
    )..handleError(_toTypedException);
  }

  void _toTypedException(Object error) {
    if (error is GrpcError) {
      final key = error.trailers?[Exceptions.ExceptionKey];
      final callback = _map[key];
      final exception = callback == null ? error : callback(error);
      if (_onError != null) {
        _onError!(exception);
      }
      throw exception;
    }
  }
}

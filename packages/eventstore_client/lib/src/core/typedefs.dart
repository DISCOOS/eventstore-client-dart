import 'package:grpc/grpc_or_grpcweb.dart';

typedef JsonDocument = dynamic;

typedef ValueGetter<T> = T Function();
typedef ValueSetter<T> = void Function(T);

typedef GrpcErrorCallback = Exception Function(GrpcError error);

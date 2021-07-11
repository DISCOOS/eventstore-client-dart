import 'package:grpc/grpc.dart';

typedef ValueGetter<T> = T Function();
typedef ValueSetter<T> = void Function(T);

typedef GrpcErrorCallback = Exception Function(GrpcError error);

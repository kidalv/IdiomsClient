import 'package:grpc/grpc.dart';

class GrpcClientSingleton {
  ClientChannel client;
  static final GrpcClientSingleton _singleton =
      GrpcClientSingleton._internal();

  factory GrpcClientSingleton() => _singleton;

  GrpcClientSingleton._internal() {
    client = ClientChannel("10.0.2.2",
        port: 5000,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ));
  }
}
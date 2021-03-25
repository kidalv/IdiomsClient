import 'package:grpc/grpc.dart';

class GrpcClientSingleton {
  ClientChannel client;
  static final GrpcClientSingleton _singleton =
      GrpcClientSingleton._internal();

  factory GrpcClientSingleton() => _singleton;

  GrpcClientSingleton._internal() {
    client = ClientChannel("ec2-54-170-163-245.eu-west-1.compute.amazonaws.com",
        port: 8080,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),);
  }


  // //local
  // GrpcClientSingleton._internal() {
  //   client = ClientChannel("localhost",
  //       port: 8080,
  //       options: ChannelOptions(
  //         credentials: ChannelCredentials.insecure(),
  //       ),);
  // }
}
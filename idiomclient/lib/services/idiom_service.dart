import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';

class IdiomService {
  static IdiomClient client;

  IdiomService() {
    client = IdiomClient(
    ClientChannel(
      "10.0.2.2",
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure())
    )
  );
  }

  Future<GetIdiomInfoReply> getIdiomsInfo() async{
    return await client.getIdiomInfo(GetIdiomInfoRequest()..idiomId = 1);
  }
}
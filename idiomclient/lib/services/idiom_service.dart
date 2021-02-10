import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';
import 'package:idiomclient/services/grpc_client_singleton.dart';

class IdiomService {
  static IdiomClient client;

  IdiomService() {
    client = IdiomClient(GrpcClientSingleton().client);
  }

  Future<List<IdiomReply>> getIdiomsList() async{
    return (await client.getIdiomList(GetIdiomListRequest()..count = 50)).idioms;
  }

  Future<GetIdiomInfoReply> getIdiomsInfo(int idiomId) async{
    return await client.getIdiomInfo(GetIdiomInfoRequest()..idiomId = idiomId);
  }
}
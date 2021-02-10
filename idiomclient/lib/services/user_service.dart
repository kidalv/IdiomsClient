import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/user.pbgrpc.dart';

import 'grpc_client_singleton.dart';

class UserService {
  static UserClient client;

  UserService() {
    client = UserClient(GrpcClientSingleton().client);
  }

  Future<UserProfileReply> getUsersInfo() async{
    return await client.getUserProfile(GetUserProfileRequest()..userId = 1);
  }
}
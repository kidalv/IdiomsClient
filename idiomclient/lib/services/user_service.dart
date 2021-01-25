import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/user.pbgrpc.dart';

class UserService {
  static UserClient client;

  UserService() {
    var channel = ClientChannel(
      "10.0.2.2",
      port: 5000,
      options: ChannelOptions(credentials: ChannelCredentials.insecure())
    );
    client = UserClient(channel);
  }

  Future<UserProfileReply> getUsersInfo() async{
    return await client.getUserProfile(GetUserProfileRequest()..userId = 1);
  }
}
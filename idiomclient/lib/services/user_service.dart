import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/user.pbgrpc.dart';
import 'package:idiomclient/services/shared_prefs.dart';

import 'grpc_client_singleton.dart';

class UserService {
  static UserClient _client;

  UserService() {
    final bearer = SharedPrefs().token;
    if (bearer != null && bearer.isNotEmpty) {
      _client = UserClient(GrpcClientSingleton().client,
          options: CallOptions(metadata: {'Authorization': 'Bearer $bearer'}));
    } else {
      _client = UserClient(
        GrpcClientSingleton().client,
      );
    }
  }

  UserService.unAuthorized() {
    _client = UserClient(
      GrpcClientSingleton().client,
    );
  }

  Future<UserProfileReply> getUsersInfo() async {
    return await _client.getUserProfile(GetUserProfileRequest()..userId = 1);
  }

  Future<UserCredentialsReply> register(String email, String name, String password) async {
    return await _client.register(RegisterRequest()
      ..email = email
      ..name = name
      ..password = password);
  }

  Future<UserCredentialsReply> login(String email, String password) async {
    return await _client.login(LoginRequest()
      ..email = email
      ..password = password);
  }

  Future<UserProfileReply> changeUser(String email, String name, String password) async {
    return await _client.changeUser(ChangeUserRequest()
      ..email = email
      ..name = name
      ..password = password);
  }

  Future<UserProfileReply> addUserLanguage(int languageId) async {
    return await _client.addUserLangueage(AddUserLanguageRequest()..languageId = languageId);
  }

  Future<UserProfileReply> deleteUserLanguage(int languageId) async {
    return await _client.deleteUserLanguage(DeleteUserLanguageRequest()..languageId = languageId);
  }
}

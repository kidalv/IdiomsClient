import 'package:idiomclient/protos/user.pbgrpc.dart';
import 'package:idiomclient/services/grpc_client_singleton.dart';

class UnauthorizedUserService {
  UserClient _client;

  UnauthorizedUserService() {
    _client = UserClient(
      GrpcClientSingleton().client,
    );
  }

  Future<UserCredentialsReply> register(String email, String name, String password) async {
    try {
      return await _client.register(RegisterRequest()
        ..email = email
        ..name = name
        ..password = password);
    } catch (e) {
      return null;
    }
  }

  Future<UserCredentialsReply> login(String email, String password) async {
    try {
      return await _client.login(LoginRequest()
        ..email = email
        ..password = password);
    } catch (e) {
      return null;
    }
  }

  Future<UserCredentialsReply> googleSignIn(String jwtToken) async {
    try {
      return await _client.googleSignIn(GoogleSignInRequest()..jwtToken = jwtToken);
    } catch (e) {
      return null;
    }
  }

  Future<UserCredentialsReply> refreshToken(String refreshToken) async {
    try {
      return await _client.refreshToken(RefreshTokenRequest()..token = refreshToken);
    } catch (e) {
      return null;
    }
  }
}

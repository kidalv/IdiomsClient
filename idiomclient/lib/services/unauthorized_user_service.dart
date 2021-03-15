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

  Future<UserCredentialsReply> googleSignIn(String jwtToken) async {
    return await _client.googleSignIn(GoogleSignInRequest()..jwtToken = jwtToken);
  }

  Future<UserCredentialsReply> refreshToken(String refreshToken) async {
    return await _client.refreshToken(RefreshTokenRequest()..token = refreshToken);
  }
}

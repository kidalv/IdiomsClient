import 'package:flutter/material.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:idiomclient/services/unauthorized_user_service.dart';

class AuthorizationProvider extends ChangeNotifier {
  UnauthorizedUserService _service;
  bool isLoading;
  bool isAuthorized;

  AuthorizationProvider() {
    _service = UnauthorizedUserService();
    isLoading = true;
    getAuthorization();
  }

  Future<void> getAuthorization() async {
    final prefs = SharedPrefs();
    isLoading = true;
    notifyListeners();
    isAuthorized = false;
    if(prefs.refreshToken != null) {
      final result = await _service.refreshToken(prefs.refreshToken);
      if(result != null) {
        prefs.refreshToken = result.refreshToken;
        prefs.token = result.token;
        isAuthorized = true;
      }
    }
    isLoading = false;
    notifyListeners();
  }
}

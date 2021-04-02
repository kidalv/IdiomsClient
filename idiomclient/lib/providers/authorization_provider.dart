import 'package:flutter/material.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:idiomclient/services/unauthorized_user_service.dart';

class AuthorizationProvider extends ChangeNotifier {
  UnauthorizedUserService _service;
  bool isLoading;
  bool isAuthorized;
  String currentMessage;

  AuthorizationProvider() {
    _service = UnauthorizedUserService();
    isLoading = true;
    currentMessage = "";
    getAuthorization();
  }

  Future<void> getAuthorization() async {
    final prefs = SharedPrefs();
    currentMessage = "initialized prefs";
    isLoading = true;
    notifyListeners();
    isAuthorized = false;
    if (prefs.refreshToken != null) {
      currentMessage = "token found";
      notifyListeners();
      final result = await _service.refreshToken(prefs.refreshToken);
      if (result != null) {
        currentMessage = "authorization success";
        notifyListeners();
        prefs.refreshToken = result.refreshToken;
        prefs.token = result.token;
        isAuthorized = true;
      }
    }
    isLoading = false;
    notifyListeners();
  }
}

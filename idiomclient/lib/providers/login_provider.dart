import 'package:flutter/material.dart';
import 'package:idiomclient/services/unauthorized_user_service.dart';

import '../services/shared_prefs.dart';
import '../services/user_service.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController;
  TextEditingController passwordController;
  String _email;
  String _password;
  String emailError;
  String passwordError;
  UnauthorizedUserService _service;
  bool loginLoading = false;
  bool isAuthorized;

  LoginProvider() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _service = UnauthorizedUserService();

    emailController.addListener(notifyListeners);
    passwordController.addListener(notifyListeners);

    isAuthorized = false;
  }

  bool loginAvailable() =>
      emailController.text != null &&
      emailController.text.isNotEmpty &&
      passwordController.text != null &&
      passwordController.text.isNotEmpty;

  Future<void> login() async {
    emailError = "";
    loginLoading = true;
    notifyListeners();
    _email = emailController.text;
    _password = passwordController.text;
    final result = await _service.login(_email, _password);
    if (result != null) {
      final prefs = SharedPrefs();
      prefs.email = result.email;
      prefs.name = result.name;
      prefs.token = result.token;
      prefs.refreshToken = result.refreshToken;
      prefs.userLanguages = result.userLanguages;
      isAuthorized = true;
    } else {
      isAuthorized = false;
      emailError = "credentials doesn't match";
    }
    loginLoading = false;
    notifyListeners();
  }
}

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

  LoginProvider() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _service = UnauthorizedUserService();

    emailController.addListener(notifyListeners);
    passwordController.addListener(notifyListeners);
  }

  bool loginAvailable() =>
      emailController.text != null &&
      emailController.text.isNotEmpty &&
      passwordController.text != null &&
      passwordController.text.isNotEmpty;

  Future<void> login() async {
    loginLoading = true;
    notifyListeners();
    _email = emailController.text;
    _password = passwordController.text;
    final result = await _service.login(_email, _password);
    final prefs = SharedPrefs();
    prefs.email = result.email;
    prefs.name = result.name;
    prefs.token = result.token;
    prefs.refreshToken = result.refreshToken;
    loginLoading = false;
    notifyListeners();
  }
}

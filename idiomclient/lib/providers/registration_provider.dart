import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:idiomclient/services/unauthorized_user_service.dart';

class RegistrationProvider with ChangeNotifier {
  UnauthorizedUserService _service;
  String _email;
  String _name;
  String _password;
  String _repeatPassword;
  bool registerLoading = false;
  String error;
  String passwordError;
  String passwordRepeatError;
  String emailError;
  String nameError;
  TextEditingController emailController;
  TextEditingController nameController;
  TextEditingController passwordController;
  TextEditingController repeatPasswordController;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  RegistrationProvider() {
    _service = UnauthorizedUserService();
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();

    emailController.addListener(notifyListeners);
    nameController.addListener(notifyListeners);
    passwordController.addListener(notifyListeners);
    repeatPasswordController.addListener(notifyListeners);
  }

  Future<void> register() async {
    _email = emailController.text;
    _password = passwordController.text;
    _repeatPassword = repeatPasswordController.text;
    _name = nameController.text;
    if (_verifyModel()) {
      registerLoading = true;
      notifyListeners();
      final result = await _service.register(_email, _name, _password);
      if (result != null) {
        final prefs = SharedPrefs();
        prefs.email = result.email;
        prefs.name = result.name;
        prefs.token = result.token;
        prefs.refreshToken = result.refreshToken;
      } else {
        error = "something wrong";
      }
      registerLoading = false;
      notifyListeners();
    }
  }

  bool registerAvailable() =>
      !nameController.text.isNullOrEmpty() &&
      !emailController.text.isNullOrEmpty() &&
      !passwordController.text.isNullOrEmpty() &&
      !repeatPasswordController.text.isNullOrEmpty();

  bool _verifyModel() {
    var result = true;
    _clearErrors();

    if (_name.isNullOrEmpty()) {
      nameError = "Field is required";
    }

    if (_repeatPassword.isNullOrEmpty()) {
      passwordRepeatError = "Field is required";
    } else {
      if (_password != _repeatPassword) {
        passwordRepeatError = "Passwords doesn't match";
        result = false;
      }
    }

    if (_email.isNullOrEmpty()) {
      emailError = "Field is required";
    } else {
      if (!_verifyEmail()) {
        emailError = "Email format is not correct";
        result = false;
      }
    }

    if (_password.isNullOrEmpty()) {
      passwordError = "Field is required";
    } else {
      if (!_verifyPassword()) {
        passwordError = "At least 8 characters, 1 upper case, 1 number";
        result = false;
      }
    }

    notifyListeners();
    return result;
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    registerLoading = true;
    notifyListeners();
    final result = await _service.googleSignIn(googleSignInAuthentication.idToken);
    if (result != null) {
      final prefs = SharedPrefs();
      prefs.email = result.email;
      prefs.name = result.name;
      prefs.token = result.token;
      prefs.refreshToken = result.refreshToken;
    } else {
      error = "something wrong";
    }
    registerLoading = false;
    notifyListeners();
  }

  bool _verifyEmail() {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
  }

  bool _verifyPassword() {
    return RegExp(r"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$")
        .hasMatch(_password);
  }

  void _clearErrors() {
    nameError = null;
    emailError = null;
    passwordError = null;
    passwordRepeatError = null;
  }
}

extension NullOrEmpty on String {
  bool isNullOrEmpty() {
    return this == null || isEmpty;
  }
}

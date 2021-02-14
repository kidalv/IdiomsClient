import 'package:flutter/material.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';

class NewIdiomProvider with ChangeNotifier {
  AddIdiomRequest _idiom;
  IdiomService _service;
  LanguageReply _selectedLanguage;
  bool saving;
  bool buttonAvailable;

  NewIdiomProvider() {
    _idiom = AddIdiomRequest();
    _service = IdiomService();
    saving = false;
    buttonAvailable = false;
  }

  set text(String value) {
    _idiom..text = value;
    buttonAvailable = _buttonAvailable();
    notifyListeners();
  }

  set meaning(String value) {
    _idiom..meaning = value;
    buttonAvailable = _buttonAvailable();
    notifyListeners();
  }

  set usage(String value) {
    _idiom..usage = value;
    buttonAvailable = _buttonAvailable();
    notifyListeners();
  }

  set language(LanguageReply value) {
    _idiom..languageId = value.languageId;
    buttonAvailable = _buttonAvailable();
    notifyListeners();
  }

  LanguageReply get language => _selectedLanguage;

  Future<void> saveIdiom() async {
    saving = true;
    notifyListeners();
    await _service.addIdiom(_idiom);
    saving = false;
    notifyListeners();  
  }

  bool _buttonAvailable() => _idiom.text != null && _idiom.meaning != null && _idiom.languageId != 0 && _idiom.usage != null;
}

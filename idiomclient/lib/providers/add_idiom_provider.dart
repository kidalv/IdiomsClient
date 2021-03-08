import 'package:flutter/material.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';

class AddIdiomProvider with ChangeNotifier {
  AddIdiomRequest _idiom;
  IdiomService _service;
  LanguageReply _selectedLanguage;
  bool saving;
  TextEditingController textController;
  TextEditingController meaningController;
  TextEditingController usageController;

  AddIdiomProvider() {
    _idiom = AddIdiomRequest();
    _service = IdiomService();
    textController = TextEditingController();
    meaningController = TextEditingController();
    usageController = TextEditingController();
    saving = false;

    textController.addListener(notifyListeners);
    meaningController.addListener(notifyListeners);
    usageController.addListener(notifyListeners);
  }

  set language(LanguageReply value) {
    _selectedLanguage = value;
    _idiom..languageId = value.languageId;
    notifyListeners();
  }

  void removeLanguage() {
    _selectedLanguage = null;
    _idiom..languageId = 0;
    notifyListeners();
  }

  LanguageReply get language => _selectedLanguage;

  Future<void> saveIdiom() async {
    _idiom.text = textController.text;
    _idiom.meaning = meaningController.text;
    _idiom.usage = usageController.text;
    saving = true;
    notifyListeners();
    await _service.addIdiom(_idiom);
    saving = false;
    notifyListeners();
  }

  bool buttonAvailable() =>
      textController.text != null &&
      textController.text.isNotEmpty &&
      usageController.text != null &&
      usageController.text.isNotEmpty &&
      meaningController.text != null &&
      meaningController.text.isNotEmpty;
}

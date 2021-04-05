import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/models/idiom_link.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/dropdown_provider.dart';
import 'package:idiomclient/services/idiom_service.dart';

class AddIdiomProvider with ChangeNotifier {
  AddIdiomRequest _idiom;
  IdiomService _service;
  LanguageReply _selectedLanguage;
  List<IdiomLink> links;
  bool saving;
  TextEditingController textController;
  TextEditingController meaningController;
  TextEditingController usageController;
  final DropdownProvider provider;
  final ChangeNotifierProvider<DropdownProvider> changeNotifier;

  AddIdiomProvider(this.provider, this.changeNotifier) {
    _idiom = AddIdiomRequest();
    _service = IdiomService();
    textController = TextEditingController();
    meaningController = TextEditingController();
    usageController = TextEditingController();
    saving = false;
    links = [];
    provider.addListener(() {
      if (provider.selectedList != null && provider.selectedList.isNotEmpty) {
        if(language != null) {
          if(provider.selectedList.length > 1) {
            provider.selectedList.removeWhere((x) => x.languageId == language.languageId);
            language = provider.selectedList.first;
            provider.notifyListeners();
          }
        } else {
          language = provider.selectedList.first;
        }
      }
      notifyListeners();
    });

    textController.addListener(notifyListeners);
    meaningController.addListener(notifyListeners);
    usageController.addListener(notifyListeners);
  }

  List<IdiomLinkRequest> get linkRequests => _idiom.links;

  set language(LanguageReply value) {
    _selectedLanguage = value;
    _idiom..languageId = value.languageId;
    notifyListeners();
  }

  void removeLanguage() {
    provider.selectedList.removeWhere((x) => x.languageId == language.languageId);
    _selectedLanguage = null;
    _idiom..languageId = 0;
    notifyListeners();
    provider.notifyListeners();
  }

  void removeIdiomLink(IdiomLink idiom) {
    links.removeWhere((x) => x.idiomId == idiom.idiomId);
    notifyListeners();
  }

  LanguageReply get language => _selectedLanguage;

  Future<void> saveIdiom() async {
    _idiom.text = textController.text;
    _idiom.meaning = meaningController.text;
    _idiom.usage = usageController.text;
    _idiom.links.addAll(_mapLinks(links));
    saving = true;
    notifyListeners();
    await _service.addIdiom(_idiom);
    saving = false;
    _idiom = AddIdiomRequest();
    textController.clear();
    usageController.clear();
    meaningController.clear();
    _selectedLanguage = null;
    links = [];
    notifyListeners();
  }

  List<IdiomLinkRequest> _mapLinks(List<IdiomLink> links) {
    return links.map((x) => IdiomLinkRequest()..idiomId = x.idiomId).toList();
  }

  bool buttonAvailable() =>
      textController.text != null &&
      textController.text.isNotEmpty &&
      usageController.text != null &&
      usageController.text.isNotEmpty &&
      meaningController.text != null &&
      meaningController.text.isNotEmpty &&
      _idiom != null &&
      _idiom.languageId != 0;
}

import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:idiomclient/services/user_service.dart';

class SettingsProvider with ChangeNotifier {
 bool isLoading;
 SharedPrefs _prefs;
 String systemLanguage;
 List<LanguageReply> userLanguages; 
 UserService _service;

 SettingsProvider(){
   isLoading = true;
   _prefs = SharedPrefs();
   _service = UserService();
   systemLanguage = _prefs.systemLanguage;
   userLanguages = _prefs.userLanguages;
 }
 
 bool get showFlags => _prefs.showFlags;

 bool get hideTooltips => _prefs.hideTooltips;

 void setShowFlags(bool value) {
   _prefs.showFlags = value;
   notifyListeners();
 }

 void setHideTooltips(bool value) {
   _prefs.hideTooltips = value;
   notifyListeners();
 }

 void setSystemLanguage(String language) {
   _prefs.systemLanguage = language;
   systemLanguage = language;
   notifyListeners();
 }

 Future<void> addLanguage(LanguageReply language) async {
   userLanguages.add(language);
   _prefs.userLanguages = userLanguages;
   notifyListeners();
   await _service.addUserLanguage(language.languageId);
 }

 void removeLanguage(LanguageReply language) {
   userLanguages.remove(language);
   _prefs.userLanguages = userLanguages; 
   notifyListeners();
 }
}
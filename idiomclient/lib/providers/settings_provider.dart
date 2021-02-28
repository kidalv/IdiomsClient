import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class SettingsProvider with ChangeNotifier {
 bool isLoading;
 SharedPrefs _prefs;
 String systemLanguage;
 List<LanguageReply> userLanguages; 

 SettingsProvider(){
   isLoading = true;
   _prefs = SharedPrefs();
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

 void addLanguage(LanguageReply language) {
   userLanguages.add(language);
   _prefs.userLanguages = userLanguages;
   notifyListeners();
 }

 void removeLanguage(LanguageReply language) {
   userLanguages.remove(language);
   _prefs.userLanguages = userLanguages; 
   notifyListeners();
 }
}
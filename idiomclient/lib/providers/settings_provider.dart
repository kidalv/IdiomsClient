import 'package:flutter/material.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class SettingsProvider with ChangeNotifier {
 bool isLoading;
 SharedPrefs _prefs;

 SettingsProvider(){
   isLoading = true;
   _prefs = SharedPrefs();
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
}
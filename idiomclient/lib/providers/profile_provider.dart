import 'package:flutter/material.dart';
import 'package:idiomclient/protos/user.pb.dart';
import 'package:idiomclient/services/user_service.dart';

class ProfileProvider with ChangeNotifier {
 UserProfileReply profile;
 UserService _service;
 bool isLoading;


 ProfileProvider(){
   _service = UserService();
   isLoading = true;
 }

 Future<void> getProfile() async {
   isLoading = true;
   notifyListeners();
   profile = await _service.getUsersInfo();
   isLoading = false;
   notifyListeners();
 }
 
}
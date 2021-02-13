import 'package:flutter/material.dart';
import 'package:idiomclient/services/user_service.dart';

class ProfileProvider with ChangeNotifier {
 UserService _service;
 bool isLoading;

 ProfileProvider(){
   _service = new UserService();
   isLoading = true;
 }
 
}
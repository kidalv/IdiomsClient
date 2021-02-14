

import 'package:flutter/material.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';

class IdiomListProvider with ChangeNotifier {
 IdiomService _service;
 List<IdiomReply> list;
 bool isLoading;

 IdiomListProvider(){
   _service = IdiomService();
   isLoading = true;
   list = [];
 }


 Future<void> getList() async {
   isLoading = true;
   notifyListeners();
   list = await _service.getIdiomsList();
   isLoading = false;
   notifyListeners();
 }
}
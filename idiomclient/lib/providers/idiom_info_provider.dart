import 'package:flutter/material.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';

class IdiomInfoProvider with ChangeNotifier {
 IdiomService _service;
 bool isLoading;
 int _idiomId;
 GetIdiomInfoReply idiom;

 IdiomInfoProvider(int idiomId){
   _service = IdiomService();
   isLoading = true;
   _idiomId = idiomId;
   getIdiom();
 }


 Future<void> getIdiom() async {
   isLoading = true;
   notifyListeners();
   idiom = await _service.getIdiomsInfo(_idiomId);
   isLoading = false;
   notifyListeners();
 }
}
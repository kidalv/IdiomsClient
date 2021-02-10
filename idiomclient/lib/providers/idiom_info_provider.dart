import 'package:flutter/material.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';

class IdiomInfoProvider with ChangeNotifier {
 IdiomService _service;
 bool isLoading;
 int idiomId;
 GetIdiomInfoReply idiom;

 IdiomInfoProvider(int idiomId){
   _service = new IdiomService();
   isLoading = true;
   this.idiomId = idiomId;
   getIdiom();
 }


 getIdiom() async {
   isLoading = true;
   notifyListeners();
   idiom = await _service.getIdiomsInfo(idiomId);
   isLoading = false;
   notifyListeners();
 }
}
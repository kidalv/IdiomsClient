import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';

class FavoritesProvider with ChangeNotifier {
 IdiomService _service;
 List<IdiomReply> list;
 bool isLoading;

 FavoritesProvider(){
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
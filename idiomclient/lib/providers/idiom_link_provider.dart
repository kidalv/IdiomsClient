import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';

class IdiomLinkProvider with ChangeNotifier {
  IdiomService _service;
  List<IdiomReply> idioms;
  TextEditingController inputController;
  bool isLoading = false;
  bool isOpened = false;

  IdiomLinkProvider() {
    _service = IdiomService();
    inputController = TextEditingController();
    idioms = [];
  }

  Future<void> search() async{
    isLoading = true;
    isOpened = true;
    notifyListeners();
    idioms = await _service.fastSearch(inputController.text);
    isLoading = false;
    notifyListeners();
  }

  void clear() {
    inputController.clear();
    close();
  }

  void close() {
  isOpened = false;
    idioms = [];
    notifyListeners();
  }
}
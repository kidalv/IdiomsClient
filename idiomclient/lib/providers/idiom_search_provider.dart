import 'dart:io';

import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class IdiomSearchProvider extends ChangeNotifier {
  TextEditingController searchController;
  IdiomService _service;
  List<IdiomReply> idioms;
  Offset buttonPosition;
  final GlobalKey key = LabeledGlobalKey("button_icon");
  final bool closeOnSelect;
  bool isLoading;

  IdiomSearchProvider({this.closeOnSelect = false}) {
    searchController = TextEditingController();
    _service = IdiomService();
    isLoading = true;
    idioms = [];
  }

  Future findIdioms(String text) async {
    isLoading = true;
    notifyListeners();
    idioms = await _service.fastSearch(text);
    isLoading = false;
    notifyListeners();
  }

  void findButton() {
    final RenderBox renderBox = key.currentContext.findRenderObject() as RenderBox;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }
}

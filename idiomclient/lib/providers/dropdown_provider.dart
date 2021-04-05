import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class DropdownProvider extends ChangeNotifier {
  List<LanguageReply> selectedList;
  List<LanguageReply> allItems;
  TextEditingController searchController;
  Offset buttonPosition;
  final GlobalKey key = LabeledGlobalKey("button_icon");
  final bool closeOnSelect;

  DropdownProvider({this.closeOnSelect = false}) {
    allItems = SharedPrefs().languages;
    selectedList = [];
    searchController = TextEditingController();
  }

  List<LanguageReply> getTempList() {
    return allItems
        .where((x) =>
            !selectedList.any((y) => y.languageId == x.languageId) &&
            (searchController.text.isEmpty ||
                x.name.toLowerCase().contains(searchController.text.toLowerCase())))
        .toList();
  }

  void selectLanguage(LanguageReply language) {
    selectedList.add(language);
    notifyListeners();
  }

  void findButton() {
    final RenderBox renderBox = key.currentContext.findRenderObject() as RenderBox;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }
}

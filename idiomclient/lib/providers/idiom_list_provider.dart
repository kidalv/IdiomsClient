import 'package:flutter/material.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/protos/timestamp.pb.dart';
import 'package:idiomclient/services/idiom_service.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class IdiomListProvider with ChangeNotifier {
  IdiomService _service;
  List<IdiomReply> list;
  bool isLoading;
  Sort currentSort;
  List<LanguageReply> selectedLanguages;
  List<LanguageReply> allLanguages;

  IdiomListProvider() {
    _service = IdiomService();
    isLoading = true;
    list = [];
    currentSort = Sort.date;
    selectedLanguages = [];
    allLanguages = SharedPrefs().languages;
  }

  Future<void> getList() async {
    isLoading = true;
    notifyListeners();
    list = await _service.getIdiomsList();
    // list.add(IdiomReply()
    //   ..text = "shit"
    //   ..dateAdded = Timestamp()
    //   ..favoritesCount = 1
    //   ..idiomId = 1
    //   ..upvoteCount = 1
    //   ..language = (LanguageReply()
    //     ..locale = "lv"
    //     ..region = "LV"));
    isLoading = false;
    notifyListeners();
  }

  void changeSort(Sort sort) {
    currentSort = sort;
    _applySort();
    notifyListeners();
  }

  void _applySort() {
    switch (currentSort) {
      case Sort.date:
        list.sort((a, b) => a.dateAdded.toDateTime().compareTo(b.dateAdded.toDateTime()));
        break;
      case Sort.comments:
        break;
      case Sort.upvotes:
        list.sort((a, b) => b.upvoteCount.compareTo(a.upvoteCount));
        break;
      case Sort.favorites:
        list.sort((a, b) => b.favoritesCount.compareTo(a.favoritesCount));
        break;
      case Sort.languages:
        break;
      default:
    }
  }
}

enum Sort { date, upvotes, favorites, languages, comments }

import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/idiom_list_provider.dart';
import 'package:idiomclient/services/idiom_service.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class FavoritesProvider with ChangeNotifier {
  IdiomService _service;
  List<IdiomReply> list;
  bool isLoading;
  Sort currentSort;
  List<LanguageReply> selectedLanguages;
  List<LanguageReply> allLanguages;


 FavoritesProvider(){
    _service = IdiomService();
    isLoading = true;
    list = [];
    currentSort = SharedPrefs().listSort;
    selectedLanguages = [];
    allLanguages = SharedPrefs().languages;
    getList();
 }


 Future<void> getList() async {
   isLoading = true;
   notifyListeners();
   list = await _service.getIdiomsList(isFavorite: true);
   isLoading = false;
   notifyListeners();
 }

   void changeSort(Sort sort) {
    currentSort = sort;
    SharedPrefs().listSort = sort;
    _applySort();
    notifyListeners();
  }

  void _applySort() {
    switch (currentSort) {
      case Sort.date:
        list.sort((a, b) => b.dateAdded.toDateTime().compareTo(a.dateAdded.toDateTime()));
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
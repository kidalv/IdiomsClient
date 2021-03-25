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
  bool isAdditionalLoading;
  bool noMoreElements;
  Sort currentSort;
  List<LanguageReply> selectedLanguages;
  List<LanguageReply> allLanguages;
  bool _myLanguages;
  bool _translationInAll;
  ScrollController scrollController;

  IdiomListProvider() {
    _service = IdiomService();
    isLoading = true;
    isAdditionalLoading = false;
    noMoreElements = false;
    list = [];
    currentSort = SharedPrefs().listSort;
    selectedLanguages = [];
    allLanguages = SharedPrefs().languages;
    _myLanguages = false;
    _translationInAll = false;
    scrollController = ScrollController();
    scrollController.addListener(() {
      final tileHeight = (scrollController.position.viewportDimension - 100) * 0.25;
      final currentPosition = scrollController.offset / tileHeight;
      if (list.length - currentPosition < 5 && !isAdditionalLoading && !noMoreElements) {
        appendList();
      }
    });
    getList();
  }

  Future<void> getList() async {
    isLoading = true;
    noMoreElements = false;
    final myLanguages = SharedPrefs().userLanguages;
    if (myLanguages.any((x) => !selectedLanguages.any((y) => y.languageId == x.languageId))) {
      _myLanguages = false;
    }
    notifyListeners();
    list = await _service.getIdiomsList(
        languages: selectedLanguages.map((x) => x.languageId).toList(),
        sort: currentSort.toText(),
        allTranslations: _translationInAll);
    _applySort();
    isLoading = false;
    notifyListeners();
  }

  Future<void> appendList() async {
    isAdditionalLoading = true;
    notifyListeners();
    final additionalIdioms = await _service.getIdiomsList(
        languages: selectedLanguages.map((x) => x.languageId).toList(),
        sort: currentSort.toText(),
        allTranslations: _translationInAll,
        skip: list.length);
    if (additionalIdioms.length < 10) {
      noMoreElements = true;
    }
    list.addAll(additionalIdioms);
    _applySort();
    isAdditionalLoading = false;    
    notifyListeners();
  }

  set translationInAll(bool value) {
    _translationInAll = value;
    getList();
  }

  set myLanguages(bool value) {
    _myLanguages = value;
    final myLanguages = SharedPrefs().userLanguages;
    if (value) {
      myLanguages.removeWhere((x) => selectedLanguages.any((y) => y.languageId == x.languageId));
      selectedLanguages.addAll(myLanguages);
    } else {
      selectedLanguages.removeWhere((x) => myLanguages.any((y) => y.languageId == x.languageId));
    }
    getList();
  }

  bool get translationInAll => _translationInAll;

  bool get myLanguages => _myLanguages;

  void changeSort(Sort sort) {
    currentSort = sort;
    SharedPrefs().listSort = sort;
    if (list.length < 50) {
      _applySort();
    } else {
      getList();
    }
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

enum Sort { date, upvotes, favorites, languages, comments }

extension MyEnumEx on Sort {
  String toText() => toString().split('.')[1];
}

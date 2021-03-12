import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/models/idiom_link.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/add_idiom_provider.dart';
import 'package:idiomclient/services/idiom_service.dart';

class IdiomLinkProvider with ChangeNotifier {
  IdiomService _service;
  List<IdiomReply> idioms;
  TextEditingController inputController;
  bool isLoading = false;
  bool isOpened = false;
  final ChangeNotifier _idiomProvider;
  final List<IdiomLink> _links;
  final bool doSaveLinks;
  final int currentIdiomId;

  IdiomLinkProvider(this._idiomProvider, this._links, {this.doSaveLinks = false, this.currentIdiomId}) {
    _service = IdiomService();
    inputController = TextEditingController();
    idioms = [];
  }

  Future<void> search() async{
    isLoading = true;
    isOpened = true;
    notifyListeners();
    idioms = await _service.fastSearch(inputController.text);
    _removeExistingLinks();
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

  void addIdiom(IdiomReply idiom) {
    _links.add(IdiomLink()..idiomId = idiom.idiomId..language = idiom.language..text = idiom.text);
    if(doSaveLinks) {
      _service.addIdiomLink(currentIdiomId, idiom.idiomId);
    }
    _idiomProvider.notifyListeners();
    _removeExistingLinks();
    notifyListeners();
  }

  void _removeExistingLinks() {
    idioms.removeWhere((x) => _links.any((y) => y.idiomId == x.idiomId));
  }
}
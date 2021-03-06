import 'package:flutter/material.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/protos/timestamp.pb.dart';
import 'package:idiomclient/services/action_service.dart';
import 'package:idiomclient/services/idiom_service.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class IdiomInfoProvider with ChangeNotifier {
  IdiomService _service;
  ActionService _actionService;
  bool isLoading;
  int _idiomId;
  GetIdiomInfoReply idiom;
  String _comment;
  bool commentDisabled;
  TextEditingController commentController;
  bool commentSending;
  bool sortByDate;

  IdiomInfoProvider(int idiomId) {
    _service = IdiomService();
    _actionService = ActionService();
    commentController = TextEditingController();
    isLoading = true;
    _idiomId = idiomId;
    commentSending = false;
    getIdiom();
    commentDisabled = true;
    sortByDate = true;
  }

  Future<void> getIdiom() async {
    isLoading = true;
    notifyListeners();
    idiom = await _service.getIdiomsInfo(_idiomId);
    sortComments();
    isLoading = false;
    notifyListeners();
  }

  void setComment(String value) {
    _comment = value;
    if (_comment.isNotEmpty && !commentSending) {
      commentDisabled = false;
      notifyListeners();
    } else {
      commentDisabled = true;
      notifyListeners();
    }
  }

  Future<void> addComment() async {
    commentSending = true;
    commentDisabled = true;
    commentController.clear();
    notifyListeners();
    final result = await _actionService.addComment(_idiomId, _comment);
    idiom.comments.add(result);
    _comment = null;
    sortComments();
    commentSending = false;
    commentDisabled = false;
    notifyListeners();
  }

  Future<void> addFavorite() async {
    if (idiom.isFavorite) {
      final result = await _actionService.deleteFavorite(_idiomId);
      idiom.isFavorite = !result;
      idiom.favoritesCount -= 1;
    } else {
      final result = await _actionService.addFavorite(_idiomId);
      idiom..isFavorite = result;
      idiom.favoritesCount += 1;
    }
    notifyListeners();
  }

  Future<void> addUpvote() async {
    if (!idiom.isUserUpvoted) {
      final result = await _actionService.addUpvote(_idiomId, true);
      idiom..isUserUpvoted = result;
      idiom..isUpvote = true;
      idiom.upvoteCount += 1;
      notifyListeners();
    } else {
      if (!idiom.isUpvote) {
        final result = await _actionService.addUpvote(_idiomId, true);
        idiom..isUserUpvoted = result;
        idiom..isUpvote = true;
        idiom.upvoteCount += 2;
        notifyListeners();
      } else {
        await _actionService.deleteUpvote(_idiomId);
        idiom..isUserUpvoted = false;
        idiom..isUpvote = false;
        idiom.upvoteCount -= 1;
        notifyListeners();
      }
    }
  }

  Future<void> addDevote() async {
    if (!idiom.isUserUpvoted) {
      final result = await _actionService.addUpvote(_idiomId, false);
      idiom..isUserUpvoted = result;
      idiom..isUpvote = false;
      idiom.upvoteCount -= 1;
      notifyListeners();
    } else {
      if (idiom.isUpvote) {
        final result = await _actionService.addUpvote(_idiomId, false);
        idiom..isUserUpvoted = result;
        idiom..isUpvote = false;
        idiom.upvoteCount -= 2;
        notifyListeners();
      } else {
        await _actionService.deleteUpvote(_idiomId);
        idiom..isUserUpvoted = false;
        idiom..isUpvote = false;
        idiom.upvoteCount += 1;
        notifyListeners();
      }
    }
  }

  Future<void> addReport(String text) async {
    final result = await _actionService.addReport(_idiomId, text);
    // TODO Something
  }

  void sortComments() {
    if (sortByDate) {
      idiom.comments.sort((a, b) => b.date.toDateTime().compareTo(a.date.toDateTime()));
    }
  }
}

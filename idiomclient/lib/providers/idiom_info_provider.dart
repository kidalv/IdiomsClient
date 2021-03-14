import 'package:flutter/material.dart';
import 'package:idiomclient/models/idiom_link.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/protos/timestamp.pb.dart';
import 'package:idiomclient/providers/idiom_list_provider.dart';
import 'package:idiomclient/services/action_service.dart';
import 'package:idiomclient/services/idiom_service.dart';
import 'package:idiomclient/providers/providers.dart';

class IdiomInfoProvider with ChangeNotifier {
  IdiomService _service;
  ActionService _actionService;
  bool isLoading;
  int idiomId;
  GetIdiomInfoReply idiom;
  String _comment;
  bool commentDisabled;
  TextEditingController commentController;
  bool commentSending;
  bool sortByDate;
  List<IdiomLink> links;
  IdiomReply _listIdiom;
  final IdiomListProvider _listProvider;

  IdiomInfoProvider(this._listIdiom, this._listProvider) {
    _service = IdiomService();
    _actionService = ActionService();
    commentController = TextEditingController();
    isLoading = true;
    idiomId = _listIdiom.idiomId;
    commentSending = false;
    getIdiom();
    commentDisabled = true;
    sortByDate = true;
  }

  void getOtherIdiomWithLinks(IdiomReply listIdiom) {
    isLoading = true;
    idiomId = listIdiom.idiomId;
    _listIdiom = listIdiom;
    commentSending = false;
    getIdiomWithLinks();
    commentDisabled = true;
    sortByDate = true;
  }

  Future<void> getIdiom() async {
    isLoading = true;
    notifyListeners();
    idiom = await _service.getIdiomsInfo(idiomId);
    idiom.translations.add(IdiomLinkReply()
      ..idiomId = idiom.idiomId
      ..language = idiom.language);
    links = _mapLinks(idiom.translations);
    _setFirstLink();
    sortComments();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getIdiomWithLinks() async {
    isLoading = true;
    notifyListeners();
    idiom = await _service.getIdiomsInfo(idiomId);
    idiom.translations.add(IdiomLinkReply()
      ..idiomId = idiom.idiomId
      ..language = idiom.language);
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
    final result = await _actionService.addComment(idiomId, _comment);
    idiom.comments.add(result);
    _comment = null;
    sortComments();
    commentSending = false;
    commentDisabled = false;
    notifyListeners();
  }

  Future<void> addFavorite() async {
    if (idiom.isFavorite) {
      final result = await _actionService.deleteFavorite(idiomId);
      idiom.isFavorite = !result;
      idiom.favoritesCount -= 1;
      _listIdiom.favoritesCount -= 1;
      _listIdiom.isFavorite = !result;
    } else {
      final result = await _actionService.addFavorite(idiomId);
      idiom..isFavorite = result;
      idiom.favoritesCount += 1;
      _listIdiom.favoritesCount += 1;
      _listIdiom.isFavorite = result;
    }
    _listProvider.notifyListeners();
    notifyListeners();
  }

  Future<void> addUpvote() async {
    if (!idiom.isUserUpvoted) {
      final result = await _actionService.addUpvote(idiomId, true);
      idiom..isUserUpvoted = result;
      idiom..isUpvote = true;
      idiom.upvoteCount += 1;
      _listIdiom.upvoteCount += 1;
    } else {
      if (!idiom.isUpvote) {
        final result = await _actionService.addUpvote(idiomId, true);
        idiom..isUserUpvoted = result;
        idiom..isUpvote = true;
        idiom.upvoteCount += 2;
        _listIdiom.upvoteCount += 2;
      } else {
        await _actionService.deleteUpvote(idiomId);
        idiom..isUserUpvoted = false;
        idiom..isUpvote = false;
        idiom.upvoteCount -= 1;
        _listIdiom.upvoteCount -= 1;
      }
    }
    _listProvider.notifyListeners();
    notifyListeners();
  }

  Future<void> addDevote() async {
    if (!idiom.isUserUpvoted) {
      final result = await _actionService.addUpvote(idiomId, false);
      idiom..isUserUpvoted = result;
      idiom..isUpvote = false;
      idiom.upvoteCount -= 1;
      _listIdiom.upvoteCount -= 1;
    } else {
      if (idiom.isUpvote) {
        final result = await _actionService.addUpvote(idiomId, false);
        idiom..isUserUpvoted = result;
        idiom..isUpvote = false;
        idiom.upvoteCount -= 2;
        _listIdiom.upvoteCount -= 2;
      } else {
        await _actionService.deleteUpvote(idiomId);
        idiom..isUserUpvoted = false;
        idiom..isUpvote = false;
        idiom.upvoteCount += 1;
        _listIdiom.upvoteCount += 1;
      }
    }
    _listProvider.notifyListeners();
    notifyListeners();
  }

  Future<void> addLike(CommentReply comment) async {
    if (comment.userCommentLikeAdded) {
      if (comment.isUserLike) {
        await _actionService.deleteCommentLike(comment.commentId);
        comment.userCommentLikeAdded = false;
        comment.isUserLike = false;
        comment.likesCount -= 1;
      } else {
        await _actionService.addCommentLike(comment.commentId);
        comment.userCommentLikeAdded = true;
        comment.isUserLike = true;
        comment.likesCount += 1;
        comment.dislikesCount -= 1;
      }
    } else {
      await _actionService.addCommentLike(comment.commentId);
      comment.userCommentLikeAdded = true;
      comment.isUserLike = true;
      comment.likesCount += 1;
    }
    notifyListeners();
  }

  Future<void> addDisLike(CommentReply comment) async {
    if (comment.userCommentLikeAdded) {
      if (!comment.isUserLike) {
        await _actionService.deleteCommentLike(comment.commentId);
        comment.userCommentLikeAdded = false;
        comment.isUserLike = false;
        comment.dislikesCount -= 1;
      } else {
        await _actionService.addCommentDisLike(comment.commentId);
        comment.userCommentLikeAdded = true;
        comment.isUserLike = false;
        comment.likesCount -= 1;
        comment.dislikesCount += 1;
      }
    } else {
      await _actionService.addCommentDisLike(comment.commentId);
      comment.userCommentLikeAdded = true;
      comment.isUserLike = false;
      comment.dislikesCount += 1;
    }
    notifyListeners();
  }

  List<IdiomLink> _mapLinks(List<IdiomLinkReply> linkReplyes) {
    return linkReplyes
        .map((x) => IdiomLink()
          ..idiomId = x.idiomId
          ..language = x.language)
        .toList();
  }

  void _setFirstLink() {
    final link = links.where((x) => x.idiomId == idiom.idiomId).first;
    links.removeWhere((x) => x.idiomId == idiom.idiomId);
    links.insert(0, link);
  }

  Future<void> addReport(String text) async {
    final result = await _actionService.addReport(idiomId, text);
    // TODO Something
  }

  void sortComments() {
    if (sortByDate) {
      idiom.comments.sort((a, b) => b.date.toDateTime().compareTo(a.date.toDateTime()));
    }
  }
}

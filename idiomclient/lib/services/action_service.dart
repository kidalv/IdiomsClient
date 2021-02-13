import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/action.pbgrpc.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/grpc_client_singleton.dart';

class ActionService {
  static ActionClient _client;

  ActionService() {
    _client = ActionClient(GrpcClientSingleton().client);
  }

  Future<bool> addUpvote(int idiomId, bool isUpvote) async {
    var result = await _client.addUpvote(AddUpvoteRequest()
      ..idiomId = idiomId
      ..isUpvote = isUpvote);
    return result != null;
  }

  Future<bool> addFavorite(int idiomId) async {
    var result = await _client.addFavorite(AddFavoriteRequest()..idiomId = idiomId);
    return result != null;
  }

  Future<bool> addReport(int idiomId, String text) async {
    var result = await _client.addReport(AddReportRequest()
      ..idiomId = idiomId
      ..text = text);
    return result != null;
  }

  Future<CommentReply> addComment(int idiomId, String text) async {
    return await _client.addComment(AddCommentRequest()
      ..idiomId = idiomId
      ..text = text);
  }

  Future<CommentReply> changeComment(int commentId, String text) async {
    return await _client.changeComment(ChangeCommentRequest()
      ..commentId = commentId
      ..text = text);
  }

  Future<bool> chnageUpvote(int idiomId, bool isUpvote) async {
    var result = await _client.changeUpvote(ChangeUpvoteRequest()
      ..idiomId = idiomId
      ..isUpvote = isUpvote);
    return result != null;
  }

  Future<bool> deleteUpvote(int idiomId) async {
    var result = await _client.deleteUpvote(DeleteUpvoteRequest()..idiomId);
    return result != null;
  }

  Future<bool> deleteFavorite(int idiomId) async {
    var result = await _client.deleteFavorite(DeleteFavoriteRequest()..idiomId = idiomId);
    return result != null;
  }

  Future<bool> deleteComment(int commentId) async {
    var result = await _client.deleteComment(DeleteCommentRequest()..commentId = commentId);
    return result != null;
  }

  Future<List<LanguageReply>> getAllLAnguages() async {
    var result = await _client.getAllLanguages(GetAllLanguagesRequest());
    return result.languages;
  }
}

import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/action.pbgrpc.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/grpc_client_singleton.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class ActionService {
  static ActionClient _client;

  ActionService() {
    final bearer = SharedPrefs().token;
    if (bearer != null && bearer.isNotEmpty) {
      _client = ActionClient(GrpcClientSingleton().client,
          options: CallOptions(metadata: {'Authorization': 'Bearer $bearer'}));
    } else {
      _client = ActionClient(
        GrpcClientSingleton().client,
      );
    }
  }

  Future<bool> addUpvote(int idiomId, bool isUpvote) async {
    final result = await _client.addUpvote(AddUpvoteRequest()
      ..idiomId = idiomId
      ..isUpvote = isUpvote);
    return result != null;
  }

  Future<bool> addFavorite(int idiomId) async {
    final result = await _client.addFavorite(AddFavoriteRequest()..idiomId = idiomId);
    return result != null;
  }

  Future<bool> addReport(int idiomId, String text) async {
    final result = await _client.addReport(AddReportRequest()
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

  Future<bool> deleteUpvote(int idiomId) async {
    final result = await _client.deleteUpvote(DeleteUpvoteRequest()..idiomId = idiomId);
    return result != null;
  }

  Future<bool> deleteFavorite(int idiomId) async {
    final result = await _client.deleteFavorite(DeleteFavoriteRequest()..idiomId = idiomId);
    return result != null;
  }

  Future<bool> deleteComment(int commentId) async {
    final result = await _client.deleteComment(DeleteCommentRequest()..commentId = commentId);
    return result != null;
  }

  Future<List<LanguageReply>> getAllLAnguages() async {
    final result = await _client.getAllLanguages(GetAllLanguagesRequest());
    return result.languages;
  }
}

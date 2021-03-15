import 'package:grpc/grpc.dart';
import 'package:idiomclient/protos/idiom.pbgrpc.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/grpc_client_singleton.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class IdiomService {
  static IdiomClient _client;

  IdiomService() {
    final bearer = SharedPrefs().token;
    if (bearer != null && bearer.isNotEmpty) {
      _client = IdiomClient(GrpcClientSingleton().client,
          options: CallOptions(metadata: {'Authorization': 'Bearer $bearer'}));
    } else {
      _client = IdiomClient(GrpcClientSingleton().client);
    }
  }

  Future<List<IdiomReply>> getIdiomsList({
    String sort = "",
    String search = "",
    List<int> languages = const [],
    bool isFavorite = false,
    bool allTranslations = false,
  }) async {
    return (await _client.getIdiomList(GetIdiomListRequest()
          ..count = 50
          ..favorites = isFavorite
          ..languageIds.addAll(languages)
          ..search = search
          ..sort = sort
          ..translatedInAllLanguages = allTranslations))
        .idioms;
  }

  Future<GetIdiomInfoReply> getIdiomsInfo(int idiomId) async {
    return await _client.getIdiomInfo(GetIdiomInfoRequest()..idiomId = idiomId);
  }

  Future<GetIdiomInfoReply> addIdiom(AddIdiomRequest idiom) async {
    return await _client.addIdiom(idiom);
  }

  Future<GetIdiomInfoReply> changeIdiom(
      int idiomId, int languageId, String text, String meaning, String usage) async {
    return await _client.changeIdiom(ChangeIdiomRequest()
      ..idiomId = idiomId
      ..languageId = languageId
      ..text = text
      ..meaning = meaning
      ..usage = usage);
  }

  Future<bool> deleteIdiom(int idiomId) async {
    final result = await _client.deleteIdiom(DeleteIdiomRequest()..idiomId = idiomId);
    return result != null;
  }

  Future<List<IdiomReply>> fastSearch(String name) async {
    return (await _client.fastSearch(FastSearchRequest()..idiomName = name)).idioms;
  }

  Future<IdiomLinkReply> addIdiomLink(int currentIdiom, int linkedIdiom) async {
    return await _client.addlink(AddIdiomLinkRequest()
      ..currentIdiomId = currentIdiom
      ..linkIdiomId = linkedIdiom);
  }
}

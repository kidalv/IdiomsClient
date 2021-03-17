import 'package:idiomclient/protos/action.pb.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/services/action_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:idiomclient/providers/idiom_list_provider.dart';

const String userLanguagesKey = "user_languages_key";
const String languagesKey = "languages_key";
const String nameKey = "name_key";
const String emailKey = "email_key";
const String tokenKey = "token_key";
const String showFlagsKey = "show_flags_key";
const String hideTooltipsKey = "show_tooltips_key";
const String refreshTokenKey = "refreshToken_key";
const String systemLanguageKey = "systemLanguage_key";
const String listSortKey = "listSort_key";
const String linkTypesKey = "linkTypes_key";

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  ActionService _actionService;
  bool _hideTooltips;
  bool _showFlags;
  String _token;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
    _actionService = ActionService();
    languages = await _actionService.getAllLAnguages();
    //linkTypes = await _actionService.getLinkTypes();
  }

  void logout () {
    token = null;
    refreshToken = null;
    name = null;
    email = null;
    _sharedPrefs.setStringList(userLanguagesKey, null);
  }

  String get name => _sharedPrefs.getString(nameKey) ?? "";

  String get email => _sharedPrefs.getString(emailKey) ?? "";

  String get token {
    return _token ??= _sharedPrefs.getString(tokenKey);
  }

  String get refreshToken => _sharedPrefs.getString(refreshTokenKey);

  String get systemLanguage => _sharedPrefs.getString(systemLanguageKey) ?? "GB";

  List<LinkReply> get linkTypes =>
      _mapStringListToLinkTypes(_sharedPrefs.getStringList(linkTypesKey) ?? []);

  List<LanguageReply> get languages {
    return _mapLanguageReplies(_sharedPrefs.getStringList(languagesKey));
  }

  List<LanguageReply> get userLanguages {
    return _mapLanguageReplies(_sharedPrefs.getStringList(userLanguagesKey) ?? []);
  }

  bool get showFlags => _showFlags ??= _sharedPrefs.getBool(showFlagsKey) ?? true;

  bool get hideTooltips => _hideTooltips ??= _sharedPrefs.getBool(hideTooltipsKey) ?? false;

  Sort get listSort => _mapIntToSort(_sharedPrefs.getInt(listSortKey) ?? 0);

  set name(String value) {
    _sharedPrefs.setString(nameKey, value);
  }

  set email(String value) {
    _sharedPrefs.setString(emailKey, value);
  }

  set token(String value) {
    _sharedPrefs.setString(tokenKey, value);
  }

  set refreshToken(String value) {
    _sharedPrefs.setString(refreshTokenKey, value);
  }

  set languages(List<LanguageReply> languages) {
    _sharedPrefs.setStringList(languagesKey, _mapLanguages(languages));
  }

  set userLanguages(List<LanguageReply> languages) {
    _sharedPrefs.setStringList(userLanguagesKey, _mapLanguages(languages));
  }

  set systemLanguage(String language) {
    _sharedPrefs.setString(systemLanguageKey, language);
  }

  set showFlags(bool value) {
    _showFlags = value;
    _sharedPrefs.setBool(showFlagsKey, value);
  }

  set hideTooltips(bool value) {
    _hideTooltips = value;
    _sharedPrefs.setBool(hideTooltipsKey, value);
  }

  set listSort(Sort value) {
    _sharedPrefs.setInt(listSortKey, _mapSortToInt(value));
  }

  set linkTypes(List<LinkReply> links) {
    _sharedPrefs.setStringList(linkTypesKey, _mapLinkTypesToStirngList(links));
  }

  List<String> _mapLanguages(List<LanguageReply> languages) {
    return languages
        .map((x) => "${x.languageId},${x.locale},${x.name},${x.region},${x.nativeName}")
        .toList();
  }

  List<LanguageReply> _mapLanguageReplies(List<String> languages) {
    return languages.map((x) {
      final values = x.split(",");
      return LanguageReply()
        ..languageId = int.parse(values[0])
        ..locale = values[1]
        ..name = values[2]
        ..region = values[3]
        ..nativeName = values[4];
    }).toList();
  }

  int _mapSortToInt(Sort value) {
    const sorts = Sort.values;
    for (var i = 0; i < sorts.length; i++) {
      if (sorts[i] == value) {
        return i;
      }
    }
    return 0;
  }

  Sort _mapIntToSort(int sortIndex) {
    return Sort.values[sortIndex];
  }

  List<String> _mapLinkTypesToStirngList(List<LinkReply> links) {
    return links.map((x) => "${x.linkTypeId},${x.linkName}").toList();
  }

  List<LinkReply> _mapStringListToLinkTypes(List<String> links) {
    return links.map((x) {
      final link = x.split('x');
      return LinkReply()
        ..linkTypeId = int.parse(link[0])
        ..linkName = link[1];
    }).toList();
  }
}

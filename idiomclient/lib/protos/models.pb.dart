///
//  Generated code. Do not modify.
//  source: models.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'timestamp.pb.dart' as $0;

class UserReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  UserReply._() : super();
  factory UserReply({
    $core.int userId,
    $core.String name,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory UserReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserReply clone() => UserReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserReply copyWith(void Function(UserReply) updates) => super.copyWith((message) => updates(message as UserReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserReply create() => UserReply._();
  UserReply createEmptyInstance() => create();
  static $pb.PbList<UserReply> createRepeated() => $pb.PbList<UserReply>();
  @$core.pragma('dart2js:noInline')
  static UserReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserReply>(create);
  static UserReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class LanguageReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LanguageReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'locale')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'region')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nativeName')
    ..hasRequiredFields = false
  ;

  LanguageReply._() : super();
  factory LanguageReply({
    $core.int languageId,
    $core.String name,
    $core.String locale,
    $core.String region,
    $core.String nativeName,
  }) {
    final _result = create();
    if (languageId != null) {
      _result.languageId = languageId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (locale != null) {
      _result.locale = locale;
    }
    if (region != null) {
      _result.region = region;
    }
    if (nativeName != null) {
      _result.nativeName = nativeName;
    }
    return _result;
  }
  factory LanguageReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LanguageReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LanguageReply clone() => LanguageReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LanguageReply copyWith(void Function(LanguageReply) updates) => super.copyWith((message) => updates(message as LanguageReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LanguageReply create() => LanguageReply._();
  LanguageReply createEmptyInstance() => create();
  static $pb.PbList<LanguageReply> createRepeated() => $pb.PbList<LanguageReply>();
  @$core.pragma('dart2js:noInline')
  static LanguageReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LanguageReply>(create);
  static LanguageReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get languageId => $_getIZ(0);
  @$pb.TagNumber(1)
  set languageId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get locale => $_getSZ(2);
  @$pb.TagNumber(3)
  set locale($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocale() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocale() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get region => $_getSZ(3);
  @$pb.TagNumber(4)
  set region($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRegion() => $_has(3);
  @$pb.TagNumber(4)
  void clearRegion() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nativeName => $_getSZ(4);
  @$pb.TagNumber(5)
  set nativeName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNativeName() => $_has(4);
  @$pb.TagNumber(5)
  void clearNativeName() => clearField(5);
}

class CommentReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CommentReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aOM<UserReply>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: UserReply.create)
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  CommentReply._() : super();
  factory CommentReply({
    $core.int commentId,
    $core.String text,
    UserReply user,
    $0.Timestamp date,
  }) {
    final _result = create();
    if (commentId != null) {
      _result.commentId = commentId;
    }
    if (text != null) {
      _result.text = text;
    }
    if (user != null) {
      _result.user = user;
    }
    if (date != null) {
      _result.date = date;
    }
    return _result;
  }
  factory CommentReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommentReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommentReply clone() => CommentReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommentReply copyWith(void Function(CommentReply) updates) => super.copyWith((message) => updates(message as CommentReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommentReply create() => CommentReply._();
  CommentReply createEmptyInstance() => create();
  static $pb.PbList<CommentReply> createRepeated() => $pb.PbList<CommentReply>();
  @$core.pragma('dart2js:noInline')
  static CommentReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommentReply>(create);
  static CommentReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get commentId => $_getIZ(0);
  @$pb.TagNumber(1)
  set commentId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  UserReply get user => $_getN(2);
  @$pb.TagNumber(3)
  set user(UserReply v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);
  @$pb.TagNumber(3)
  UserReply ensureUser() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get date => $_getN(3);
  @$pb.TagNumber(4)
  set date($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearDate() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureDate() => $_ensure(3);
}


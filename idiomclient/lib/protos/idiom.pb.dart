///
//  Generated code. Do not modify.
//  source: idiom.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'timestamp.pb.dart' as $1;
import 'models.pb.dart' as $2;

class GetIdiomListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetIdiomListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'skip', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'search')
    ..p<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageIds', $pb.PbFieldType.P3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sort')
    ..hasRequiredFields = false
  ;

  GetIdiomListRequest._() : super();
  factory GetIdiomListRequest({
    $core.int count,
    $core.int skip,
    $core.String search,
    $core.Iterable<$core.int> languageIds,
    $core.String sort,
  }) {
    final _result = create();
    if (count != null) {
      _result.count = count;
    }
    if (skip != null) {
      _result.skip = skip;
    }
    if (search != null) {
      _result.search = search;
    }
    if (languageIds != null) {
      _result.languageIds.addAll(languageIds);
    }
    if (sort != null) {
      _result.sort = sort;
    }
    return _result;
  }
  factory GetIdiomListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIdiomListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIdiomListRequest clone() => GetIdiomListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIdiomListRequest copyWith(void Function(GetIdiomListRequest) updates) => super.copyWith((message) => updates(message as GetIdiomListRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetIdiomListRequest create() => GetIdiomListRequest._();
  GetIdiomListRequest createEmptyInstance() => create();
  static $pb.PbList<GetIdiomListRequest> createRepeated() => $pb.PbList<GetIdiomListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetIdiomListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIdiomListRequest>(create);
  static GetIdiomListRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get skip => $_getIZ(1);
  @$pb.TagNumber(2)
  set skip($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSkip() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkip() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get search => $_getSZ(2);
  @$pb.TagNumber(3)
  set search($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSearch() => $_has(2);
  @$pb.TagNumber(3)
  void clearSearch() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get languageIds => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get sort => $_getSZ(4);
  @$pb.TagNumber(5)
  set sort($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSort() => $_has(4);
  @$pb.TagNumber(5)
  void clearSort() => clearField(5);
}

class GetIdiomInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetIdiomInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetIdiomInfoRequest._() : super();
  factory GetIdiomInfoRequest({
    $core.int idiomId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    return _result;
  }
  factory GetIdiomInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIdiomInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIdiomInfoRequest clone() => GetIdiomInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIdiomInfoRequest copyWith(void Function(GetIdiomInfoRequest) updates) => super.copyWith((message) => updates(message as GetIdiomInfoRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetIdiomInfoRequest create() => GetIdiomInfoRequest._();
  GetIdiomInfoRequest createEmptyInstance() => create();
  static $pb.PbList<GetIdiomInfoRequest> createRepeated() => $pb.PbList<GetIdiomInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static GetIdiomInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIdiomInfoRequest>(create);
  static GetIdiomInfoRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);
}

class AddIdiomRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddIdiomRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meaning')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usage')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId', $pb.PbFieldType.O3)
    ..pc<IdiomLinkRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'links', $pb.PbFieldType.PM, subBuilder: IdiomLinkRequest.create)
    ..hasRequiredFields = false
  ;

  AddIdiomRequest._() : super();
  factory AddIdiomRequest({
    $core.String text,
    $core.String meaning,
    $core.String usage,
    $core.int languageId,
    $core.Iterable<IdiomLinkRequest> links,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (meaning != null) {
      _result.meaning = meaning;
    }
    if (usage != null) {
      _result.usage = usage;
    }
    if (languageId != null) {
      _result.languageId = languageId;
    }
    if (links != null) {
      _result.links.addAll(links);
    }
    return _result;
  }
  factory AddIdiomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddIdiomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddIdiomRequest clone() => AddIdiomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddIdiomRequest copyWith(void Function(AddIdiomRequest) updates) => super.copyWith((message) => updates(message as AddIdiomRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddIdiomRequest create() => AddIdiomRequest._();
  AddIdiomRequest createEmptyInstance() => create();
  static $pb.PbList<AddIdiomRequest> createRepeated() => $pb.PbList<AddIdiomRequest>();
  @$core.pragma('dart2js:noInline')
  static AddIdiomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddIdiomRequest>(create);
  static AddIdiomRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get meaning => $_getSZ(1);
  @$pb.TagNumber(2)
  set meaning($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMeaning() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeaning() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get usage => $_getSZ(2);
  @$pb.TagNumber(3)
  set usage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUsage() => $_has(2);
  @$pb.TagNumber(3)
  void clearUsage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get languageId => $_getIZ(3);
  @$pb.TagNumber(4)
  set languageId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLanguageId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLanguageId() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<IdiomLinkRequest> get links => $_getList(4);
}

class IdiomLinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IdiomLinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linkTypeId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  IdiomLinkRequest._() : super();
  factory IdiomLinkRequest({
    $core.int idiomId,
    $core.int linkTypeId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (linkTypeId != null) {
      _result.linkTypeId = linkTypeId;
    }
    return _result;
  }
  factory IdiomLinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdiomLinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdiomLinkRequest clone() => IdiomLinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdiomLinkRequest copyWith(void Function(IdiomLinkRequest) updates) => super.copyWith((message) => updates(message as IdiomLinkRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdiomLinkRequest create() => IdiomLinkRequest._();
  IdiomLinkRequest createEmptyInstance() => create();
  static $pb.PbList<IdiomLinkRequest> createRepeated() => $pb.PbList<IdiomLinkRequest>();
  @$core.pragma('dart2js:noInline')
  static IdiomLinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdiomLinkRequest>(create);
  static IdiomLinkRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get linkTypeId => $_getIZ(1);
  @$pb.TagNumber(2)
  set linkTypeId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLinkTypeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLinkTypeId() => clearField(2);
}

class AddIdiomLinkRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddIdiomLinkRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentIdiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linkIdiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linkTypeId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AddIdiomLinkRequest._() : super();
  factory AddIdiomLinkRequest({
    $core.int currentIdiomId,
    $core.int linkIdiomId,
    $core.int linkTypeId,
  }) {
    final _result = create();
    if (currentIdiomId != null) {
      _result.currentIdiomId = currentIdiomId;
    }
    if (linkIdiomId != null) {
      _result.linkIdiomId = linkIdiomId;
    }
    if (linkTypeId != null) {
      _result.linkTypeId = linkTypeId;
    }
    return _result;
  }
  factory AddIdiomLinkRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddIdiomLinkRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddIdiomLinkRequest clone() => AddIdiomLinkRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddIdiomLinkRequest copyWith(void Function(AddIdiomLinkRequest) updates) => super.copyWith((message) => updates(message as AddIdiomLinkRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddIdiomLinkRequest create() => AddIdiomLinkRequest._();
  AddIdiomLinkRequest createEmptyInstance() => create();
  static $pb.PbList<AddIdiomLinkRequest> createRepeated() => $pb.PbList<AddIdiomLinkRequest>();
  @$core.pragma('dart2js:noInline')
  static AddIdiomLinkRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddIdiomLinkRequest>(create);
  static AddIdiomLinkRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get currentIdiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set currentIdiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentIdiomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get linkIdiomId => $_getIZ(1);
  @$pb.TagNumber(2)
  set linkIdiomId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLinkIdiomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLinkIdiomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get linkTypeId => $_getIZ(2);
  @$pb.TagNumber(3)
  set linkTypeId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLinkTypeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLinkTypeId() => clearField(3);
}

class ChangeIdiomRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChangeIdiomRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meaning')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usage')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ChangeIdiomRequest._() : super();
  factory ChangeIdiomRequest({
    $core.int idiomId,
    $core.String text,
    $core.String meaning,
    $core.String usage,
    $core.int languageId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (text != null) {
      _result.text = text;
    }
    if (meaning != null) {
      _result.meaning = meaning;
    }
    if (usage != null) {
      _result.usage = usage;
    }
    if (languageId != null) {
      _result.languageId = languageId;
    }
    return _result;
  }
  factory ChangeIdiomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeIdiomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeIdiomRequest clone() => ChangeIdiomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeIdiomRequest copyWith(void Function(ChangeIdiomRequest) updates) => super.copyWith((message) => updates(message as ChangeIdiomRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangeIdiomRequest create() => ChangeIdiomRequest._();
  ChangeIdiomRequest createEmptyInstance() => create();
  static $pb.PbList<ChangeIdiomRequest> createRepeated() => $pb.PbList<ChangeIdiomRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangeIdiomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeIdiomRequest>(create);
  static ChangeIdiomRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get meaning => $_getSZ(2);
  @$pb.TagNumber(3)
  set meaning($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeaning() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeaning() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get usage => $_getSZ(3);
  @$pb.TagNumber(4)
  set usage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUsage() => $_has(3);
  @$pb.TagNumber(4)
  void clearUsage() => clearField(4);

  @$pb.TagNumber(6)
  $core.int get languageId => $_getIZ(4);
  @$pb.TagNumber(6)
  set languageId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasLanguageId() => $_has(4);
  @$pb.TagNumber(6)
  void clearLanguageId() => clearField(6);
}

class DeleteIdiomRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteIdiomRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeleteIdiomRequest._() : super();
  factory DeleteIdiomRequest({
    $core.int idiomId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    return _result;
  }
  factory DeleteIdiomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteIdiomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteIdiomRequest clone() => DeleteIdiomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteIdiomRequest copyWith(void Function(DeleteIdiomRequest) updates) => super.copyWith((message) => updates(message as DeleteIdiomRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteIdiomRequest create() => DeleteIdiomRequest._();
  DeleteIdiomRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteIdiomRequest> createRepeated() => $pb.PbList<DeleteIdiomRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteIdiomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteIdiomRequest>(create);
  static DeleteIdiomRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);
}

class DeleteIdiomReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteIdiomReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  DeleteIdiomReply._() : super();
  factory DeleteIdiomReply({
    $core.String result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory DeleteIdiomReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteIdiomReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteIdiomReply clone() => DeleteIdiomReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteIdiomReply copyWith(void Function(DeleteIdiomReply) updates) => super.copyWith((message) => updates(message as DeleteIdiomReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteIdiomReply create() => DeleteIdiomReply._();
  DeleteIdiomReply createEmptyInstance() => create();
  static $pb.PbList<DeleteIdiomReply> createRepeated() => $pb.PbList<DeleteIdiomReply>();
  @$core.pragma('dart2js:noInline')
  static DeleteIdiomReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteIdiomReply>(create);
  static DeleteIdiomReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class GetIdiomInfoReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetIdiomInfoReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meaning')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'usage')
    ..aOM<$1.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateAdded', subBuilder: $1.Timestamp.create)
    ..aOM<$2.LanguageReply>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language', subBuilder: $2.LanguageReply.create)
    ..aOM<$2.UserReply>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'user', subBuilder: $2.UserReply.create)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'upvoteCount', $pb.PbFieldType.O3)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favoritesCount', $pb.PbFieldType.O3)
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isFavorite')
    ..pc<$2.CommentReply>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: $2.CommentReply.create)
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isUserUpvoted')
    ..aOB(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isUpvote')
    ..aOM<$1.Timestamp>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateModified', subBuilder: $1.Timestamp.create)
    ..pc<IdiomLinkReply>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'translations', $pb.PbFieldType.PM, subBuilder: IdiomLinkReply.create)
    ..pc<IdiomLinkReply>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'similar', $pb.PbFieldType.PM, subBuilder: IdiomLinkReply.create)
    ..hasRequiredFields = false
  ;

  GetIdiomInfoReply._() : super();
  factory GetIdiomInfoReply({
    $core.int idiomId,
    $core.String text,
    $core.String meaning,
    $core.String usage,
    $1.Timestamp dateAdded,
    $2.LanguageReply language,
    $2.UserReply user,
    $core.int upvoteCount,
    $core.int favoritesCount,
    $core.bool isFavorite,
    $core.Iterable<$2.CommentReply> comments,
    $core.bool isUserUpvoted,
    $core.bool isUpvote,
    $1.Timestamp dateModified,
    $core.Iterable<IdiomLinkReply> translations,
    $core.Iterable<IdiomLinkReply> similar,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (text != null) {
      _result.text = text;
    }
    if (meaning != null) {
      _result.meaning = meaning;
    }
    if (usage != null) {
      _result.usage = usage;
    }
    if (dateAdded != null) {
      _result.dateAdded = dateAdded;
    }
    if (language != null) {
      _result.language = language;
    }
    if (user != null) {
      _result.user = user;
    }
    if (upvoteCount != null) {
      _result.upvoteCount = upvoteCount;
    }
    if (favoritesCount != null) {
      _result.favoritesCount = favoritesCount;
    }
    if (isFavorite != null) {
      _result.isFavorite = isFavorite;
    }
    if (comments != null) {
      _result.comments.addAll(comments);
    }
    if (isUserUpvoted != null) {
      _result.isUserUpvoted = isUserUpvoted;
    }
    if (isUpvote != null) {
      _result.isUpvote = isUpvote;
    }
    if (dateModified != null) {
      _result.dateModified = dateModified;
    }
    if (translations != null) {
      _result.translations.addAll(translations);
    }
    if (similar != null) {
      _result.similar.addAll(similar);
    }
    return _result;
  }
  factory GetIdiomInfoReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIdiomInfoReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIdiomInfoReply clone() => GetIdiomInfoReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIdiomInfoReply copyWith(void Function(GetIdiomInfoReply) updates) => super.copyWith((message) => updates(message as GetIdiomInfoReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetIdiomInfoReply create() => GetIdiomInfoReply._();
  GetIdiomInfoReply createEmptyInstance() => create();
  static $pb.PbList<GetIdiomInfoReply> createRepeated() => $pb.PbList<GetIdiomInfoReply>();
  @$core.pragma('dart2js:noInline')
  static GetIdiomInfoReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIdiomInfoReply>(create);
  static GetIdiomInfoReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get meaning => $_getSZ(2);
  @$pb.TagNumber(3)
  set meaning($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeaning() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeaning() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get usage => $_getSZ(3);
  @$pb.TagNumber(4)
  set usage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUsage() => $_has(3);
  @$pb.TagNumber(4)
  void clearUsage() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get dateAdded => $_getN(4);
  @$pb.TagNumber(5)
  set dateAdded($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDateAdded() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateAdded() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureDateAdded() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.LanguageReply get language => $_getN(5);
  @$pb.TagNumber(6)
  set language($2.LanguageReply v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLanguage() => $_has(5);
  @$pb.TagNumber(6)
  void clearLanguage() => clearField(6);
  @$pb.TagNumber(6)
  $2.LanguageReply ensureLanguage() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.UserReply get user => $_getN(6);
  @$pb.TagNumber(7)
  set user($2.UserReply v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUser() => $_has(6);
  @$pb.TagNumber(7)
  void clearUser() => clearField(7);
  @$pb.TagNumber(7)
  $2.UserReply ensureUser() => $_ensure(6);

  @$pb.TagNumber(9)
  $core.int get upvoteCount => $_getIZ(7);
  @$pb.TagNumber(9)
  set upvoteCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpvoteCount() => $_has(7);
  @$pb.TagNumber(9)
  void clearUpvoteCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get favoritesCount => $_getIZ(8);
  @$pb.TagNumber(10)
  set favoritesCount($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasFavoritesCount() => $_has(8);
  @$pb.TagNumber(10)
  void clearFavoritesCount() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isFavorite => $_getBF(9);
  @$pb.TagNumber(11)
  set isFavorite($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasIsFavorite() => $_has(9);
  @$pb.TagNumber(11)
  void clearIsFavorite() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$2.CommentReply> get comments => $_getList(10);

  @$pb.TagNumber(13)
  $core.bool get isUserUpvoted => $_getBF(11);
  @$pb.TagNumber(13)
  set isUserUpvoted($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasIsUserUpvoted() => $_has(11);
  @$pb.TagNumber(13)
  void clearIsUserUpvoted() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isUpvote => $_getBF(12);
  @$pb.TagNumber(14)
  set isUpvote($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsUpvote() => $_has(12);
  @$pb.TagNumber(14)
  void clearIsUpvote() => clearField(14);

  @$pb.TagNumber(15)
  $1.Timestamp get dateModified => $_getN(13);
  @$pb.TagNumber(15)
  set dateModified($1.Timestamp v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasDateModified() => $_has(13);
  @$pb.TagNumber(15)
  void clearDateModified() => clearField(15);
  @$pb.TagNumber(15)
  $1.Timestamp ensureDateModified() => $_ensure(13);

  @$pb.TagNumber(16)
  $core.List<IdiomLinkReply> get translations => $_getList(14);

  @$pb.TagNumber(17)
  $core.List<IdiomLinkReply> get similar => $_getList(15);
}

class IdiomLinkReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IdiomLinkReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..aOM<$2.LanguageReply>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language', subBuilder: $2.LanguageReply.create)
    ..hasRequiredFields = false
  ;

  IdiomLinkReply._() : super();
  factory IdiomLinkReply({
    $core.int idiomId,
    $2.LanguageReply language,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (language != null) {
      _result.language = language;
    }
    return _result;
  }
  factory IdiomLinkReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdiomLinkReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdiomLinkReply clone() => IdiomLinkReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdiomLinkReply copyWith(void Function(IdiomLinkReply) updates) => super.copyWith((message) => updates(message as IdiomLinkReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IdiomLinkReply create() => IdiomLinkReply._();
  IdiomLinkReply createEmptyInstance() => create();
  static $pb.PbList<IdiomLinkReply> createRepeated() => $pb.PbList<IdiomLinkReply>();
  @$core.pragma('dart2js:noInline')
  static IdiomLinkReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdiomLinkReply>(create);
  static IdiomLinkReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);

  @$pb.TagNumber(2)
  $2.LanguageReply get language => $_getN(1);
  @$pb.TagNumber(2)
  set language($2.LanguageReply v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLanguage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLanguage() => clearField(2);
  @$pb.TagNumber(2)
  $2.LanguageReply ensureLanguage() => $_ensure(1);
}

class GetIdiomListReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetIdiomListReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..pc<$2.IdiomReply>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idioms', $pb.PbFieldType.PM, subBuilder: $2.IdiomReply.create)
    ..hasRequiredFields = false
  ;

  GetIdiomListReply._() : super();
  factory GetIdiomListReply({
    $core.Iterable<$2.IdiomReply> idioms,
  }) {
    final _result = create();
    if (idioms != null) {
      _result.idioms.addAll(idioms);
    }
    return _result;
  }
  factory GetIdiomListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIdiomListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetIdiomListReply clone() => GetIdiomListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetIdiomListReply copyWith(void Function(GetIdiomListReply) updates) => super.copyWith((message) => updates(message as GetIdiomListReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetIdiomListReply create() => GetIdiomListReply._();
  GetIdiomListReply createEmptyInstance() => create();
  static $pb.PbList<GetIdiomListReply> createRepeated() => $pb.PbList<GetIdiomListReply>();
  @$core.pragma('dart2js:noInline')
  static GetIdiomListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIdiomListReply>(create);
  static GetIdiomListReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.IdiomReply> get idioms => $_getList(0);
}


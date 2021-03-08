///
//  Generated code. Do not modify.
//  source: action.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'models.pb.dart' as $1;

class GetLinkTypesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLinkTypesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetLinkTypesRequest._() : super();
  factory GetLinkTypesRequest() => create();
  factory GetLinkTypesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLinkTypesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLinkTypesRequest clone() => GetLinkTypesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLinkTypesRequest copyWith(void Function(GetLinkTypesRequest) updates) => super.copyWith((message) => updates(message as GetLinkTypesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLinkTypesRequest create() => GetLinkTypesRequest._();
  GetLinkTypesRequest createEmptyInstance() => create();
  static $pb.PbList<GetLinkTypesRequest> createRepeated() => $pb.PbList<GetLinkTypesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLinkTypesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLinkTypesRequest>(create);
  static GetLinkTypesRequest _defaultInstance;
}

class GetLinkTypesReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLinkTypesReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..pc<LinkReply>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'links', $pb.PbFieldType.PM, subBuilder: LinkReply.create)
    ..hasRequiredFields = false
  ;

  GetLinkTypesReply._() : super();
  factory GetLinkTypesReply({
    $core.Iterable<LinkReply> links,
  }) {
    final _result = create();
    if (links != null) {
      _result.links.addAll(links);
    }
    return _result;
  }
  factory GetLinkTypesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLinkTypesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLinkTypesReply clone() => GetLinkTypesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLinkTypesReply copyWith(void Function(GetLinkTypesReply) updates) => super.copyWith((message) => updates(message as GetLinkTypesReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLinkTypesReply create() => GetLinkTypesReply._();
  GetLinkTypesReply createEmptyInstance() => create();
  static $pb.PbList<GetLinkTypesReply> createRepeated() => $pb.PbList<GetLinkTypesReply>();
  @$core.pragma('dart2js:noInline')
  static GetLinkTypesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLinkTypesReply>(create);
  static GetLinkTypesReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LinkReply> get links => $_getList(0);
}

class LinkReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LinkReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linkTypeId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'linkName')
    ..hasRequiredFields = false
  ;

  LinkReply._() : super();
  factory LinkReply({
    $core.int linkTypeId,
    $core.String linkName,
  }) {
    final _result = create();
    if (linkTypeId != null) {
      _result.linkTypeId = linkTypeId;
    }
    if (linkName != null) {
      _result.linkName = linkName;
    }
    return _result;
  }
  factory LinkReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LinkReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LinkReply clone() => LinkReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LinkReply copyWith(void Function(LinkReply) updates) => super.copyWith((message) => updates(message as LinkReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LinkReply create() => LinkReply._();
  LinkReply createEmptyInstance() => create();
  static $pb.PbList<LinkReply> createRepeated() => $pb.PbList<LinkReply>();
  @$core.pragma('dart2js:noInline')
  static LinkReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LinkReply>(create);
  static LinkReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get linkTypeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set linkTypeId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLinkTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLinkTypeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get linkName => $_getSZ(1);
  @$pb.TagNumber(2)
  set linkName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLinkName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLinkName() => clearField(2);
}

class AddUpvoteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddUpvoteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isUpvote')
    ..hasRequiredFields = false
  ;

  AddUpvoteRequest._() : super();
  factory AddUpvoteRequest({
    $core.int idiomId,
    $core.bool isUpvote,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (isUpvote != null) {
      _result.isUpvote = isUpvote;
    }
    return _result;
  }
  factory AddUpvoteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUpvoteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUpvoteRequest clone() => AddUpvoteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUpvoteRequest copyWith(void Function(AddUpvoteRequest) updates) => super.copyWith((message) => updates(message as AddUpvoteRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddUpvoteRequest create() => AddUpvoteRequest._();
  AddUpvoteRequest createEmptyInstance() => create();
  static $pb.PbList<AddUpvoteRequest> createRepeated() => $pb.PbList<AddUpvoteRequest>();
  @$core.pragma('dart2js:noInline')
  static AddUpvoteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUpvoteRequest>(create);
  static AddUpvoteRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isUpvote => $_getBF(1);
  @$pb.TagNumber(2)
  set isUpvote($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsUpvote() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsUpvote() => clearField(2);
}

class DeleteUpvoteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteUpvoteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeleteUpvoteRequest._() : super();
  factory DeleteUpvoteRequest({
    $core.int idiomId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    return _result;
  }
  factory DeleteUpvoteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUpvoteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUpvoteRequest clone() => DeleteUpvoteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUpvoteRequest copyWith(void Function(DeleteUpvoteRequest) updates) => super.copyWith((message) => updates(message as DeleteUpvoteRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteUpvoteRequest create() => DeleteUpvoteRequest._();
  DeleteUpvoteRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteUpvoteRequest> createRepeated() => $pb.PbList<DeleteUpvoteRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteUpvoteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUpvoteRequest>(create);
  static DeleteUpvoteRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);
}

class AddFavoriteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddFavoriteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AddFavoriteRequest._() : super();
  factory AddFavoriteRequest({
    $core.int idiomId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    return _result;
  }
  factory AddFavoriteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddFavoriteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddFavoriteRequest clone() => AddFavoriteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddFavoriteRequest copyWith(void Function(AddFavoriteRequest) updates) => super.copyWith((message) => updates(message as AddFavoriteRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddFavoriteRequest create() => AddFavoriteRequest._();
  AddFavoriteRequest createEmptyInstance() => create();
  static $pb.PbList<AddFavoriteRequest> createRepeated() => $pb.PbList<AddFavoriteRequest>();
  @$core.pragma('dart2js:noInline')
  static AddFavoriteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddFavoriteRequest>(create);
  static AddFavoriteRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);
}

class DeleteFavoriteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteFavoriteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeleteFavoriteRequest._() : super();
  factory DeleteFavoriteRequest({
    $core.int idiomId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    return _result;
  }
  factory DeleteFavoriteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFavoriteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFavoriteRequest clone() => DeleteFavoriteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFavoriteRequest copyWith(void Function(DeleteFavoriteRequest) updates) => super.copyWith((message) => updates(message as DeleteFavoriteRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteFavoriteRequest create() => DeleteFavoriteRequest._();
  DeleteFavoriteRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteFavoriteRequest> createRepeated() => $pb.PbList<DeleteFavoriteRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteFavoriteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFavoriteRequest>(create);
  static DeleteFavoriteRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);
}

class AddReportRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddReportRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..hasRequiredFields = false
  ;

  AddReportRequest._() : super();
  factory AddReportRequest({
    $core.int idiomId,
    $core.String text,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory AddReportRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddReportRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddReportRequest clone() => AddReportRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddReportRequest copyWith(void Function(AddReportRequest) updates) => super.copyWith((message) => updates(message as AddReportRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddReportRequest create() => AddReportRequest._();
  AddReportRequest createEmptyInstance() => create();
  static $pb.PbList<AddReportRequest> createRepeated() => $pb.PbList<AddReportRequest>();
  @$core.pragma('dart2js:noInline')
  static AddReportRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddReportRequest>(create);
  static AddReportRequest _defaultInstance;

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
}

class AddCommentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddCommentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..hasRequiredFields = false
  ;

  AddCommentRequest._() : super();
  factory AddCommentRequest({
    $core.int idiomId,
    $core.String text,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory AddCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCommentRequest clone() => AddCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCommentRequest copyWith(void Function(AddCommentRequest) updates) => super.copyWith((message) => updates(message as AddCommentRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddCommentRequest create() => AddCommentRequest._();
  AddCommentRequest createEmptyInstance() => create();
  static $pb.PbList<AddCommentRequest> createRepeated() => $pb.PbList<AddCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static AddCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCommentRequest>(create);
  static AddCommentRequest _defaultInstance;

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
}

class ChangeCommentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChangeCommentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentId', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..hasRequiredFields = false
  ;

  ChangeCommentRequest._() : super();
  factory ChangeCommentRequest({
    $core.int commentId,
    $core.String text,
  }) {
    final _result = create();
    if (commentId != null) {
      _result.commentId = commentId;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory ChangeCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeCommentRequest clone() => ChangeCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeCommentRequest copyWith(void Function(ChangeCommentRequest) updates) => super.copyWith((message) => updates(message as ChangeCommentRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChangeCommentRequest create() => ChangeCommentRequest._();
  ChangeCommentRequest createEmptyInstance() => create();
  static $pb.PbList<ChangeCommentRequest> createRepeated() => $pb.PbList<ChangeCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangeCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeCommentRequest>(create);
  static ChangeCommentRequest _defaultInstance;

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
}

class DeleteCommentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteCommentRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeleteCommentRequest._() : super();
  factory DeleteCommentRequest({
    $core.int commentId,
  }) {
    final _result = create();
    if (commentId != null) {
      _result.commentId = commentId;
    }
    return _result;
  }
  factory DeleteCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest clone() => DeleteCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentRequest copyWith(void Function(DeleteCommentRequest) updates) => super.copyWith((message) => updates(message as DeleteCommentRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest create() => DeleteCommentRequest._();
  DeleteCommentRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentRequest> createRepeated() => $pb.PbList<DeleteCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentRequest>(create);
  static DeleteCommentRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get commentId => $_getIZ(0);
  @$pb.TagNumber(1)
  set commentId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);
}

class RequestTranslationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestTranslationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RequestTranslationRequest._() : super();
  factory RequestTranslationRequest({
    $core.int idiomId,
    $core.int languageId,
  }) {
    final _result = create();
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (languageId != null) {
      _result.languageId = languageId;
    }
    return _result;
  }
  factory RequestTranslationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestTranslationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestTranslationRequest clone() => RequestTranslationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestTranslationRequest copyWith(void Function(RequestTranslationRequest) updates) => super.copyWith((message) => updates(message as RequestTranslationRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestTranslationRequest create() => RequestTranslationRequest._();
  RequestTranslationRequest createEmptyInstance() => create();
  static $pb.PbList<RequestTranslationRequest> createRepeated() => $pb.PbList<RequestTranslationRequest>();
  @$core.pragma('dart2js:noInline')
  static RequestTranslationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestTranslationRequest>(create);
  static RequestTranslationRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idiomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set idiomId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdiomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdiomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get languageId => $_getIZ(1);
  @$pb.TagNumber(2)
  set languageId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLanguageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLanguageId() => clearField(2);
}

class GetAllLanguagesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAllLanguagesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetAllLanguagesRequest._() : super();
  factory GetAllLanguagesRequest() => create();
  factory GetAllLanguagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllLanguagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllLanguagesRequest clone() => GetAllLanguagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllLanguagesRequest copyWith(void Function(GetAllLanguagesRequest) updates) => super.copyWith((message) => updates(message as GetAllLanguagesRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAllLanguagesRequest create() => GetAllLanguagesRequest._();
  GetAllLanguagesRequest createEmptyInstance() => create();
  static $pb.PbList<GetAllLanguagesRequest> createRepeated() => $pb.PbList<GetAllLanguagesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAllLanguagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllLanguagesRequest>(create);
  static GetAllLanguagesRequest _defaultInstance;
}

class DeleteReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result')
    ..hasRequiredFields = false
  ;

  DeleteReply._() : super();
  factory DeleteReply({
    $core.String result,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    return _result;
  }
  factory DeleteReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteReply clone() => DeleteReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteReply copyWith(void Function(DeleteReply) updates) => super.copyWith((message) => updates(message as DeleteReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteReply create() => DeleteReply._();
  DeleteReply createEmptyInstance() => create();
  static $pb.PbList<DeleteReply> createRepeated() => $pb.PbList<DeleteReply>();
  @$core.pragma('dart2js:noInline')
  static DeleteReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteReply>(create);
  static DeleteReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get result => $_getSZ(0);
  @$pb.TagNumber(1)
  set result($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);
}

class UpvoteReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpvoteReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'upvoteId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isUpvote')
    ..hasRequiredFields = false
  ;

  UpvoteReply._() : super();
  factory UpvoteReply({
    $core.int upvoteId,
    $core.int idiomId,
    $core.int userId,
    $core.bool isUpvote,
  }) {
    final _result = create();
    if (upvoteId != null) {
      _result.upvoteId = upvoteId;
    }
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (isUpvote != null) {
      _result.isUpvote = isUpvote;
    }
    return _result;
  }
  factory UpvoteReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpvoteReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpvoteReply clone() => UpvoteReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpvoteReply copyWith(void Function(UpvoteReply) updates) => super.copyWith((message) => updates(message as UpvoteReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpvoteReply create() => UpvoteReply._();
  UpvoteReply createEmptyInstance() => create();
  static $pb.PbList<UpvoteReply> createRepeated() => $pb.PbList<UpvoteReply>();
  @$core.pragma('dart2js:noInline')
  static UpvoteReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpvoteReply>(create);
  static UpvoteReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get upvoteId => $_getIZ(0);
  @$pb.TagNumber(1)
  set upvoteId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpvoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpvoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get idiomId => $_getIZ(1);
  @$pb.TagNumber(2)
  set idiomId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdiomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdiomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get userId => $_getIZ(2);
  @$pb.TagNumber(3)
  set userId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isUpvote => $_getBF(3);
  @$pb.TagNumber(4)
  set isUpvote($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsUpvote() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsUpvote() => clearField(4);
}

class FavoriteReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FavoriteReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favoriteId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  FavoriteReply._() : super();
  factory FavoriteReply({
    $core.int favoriteId,
    $core.int idiomId,
    $core.int userId,
  }) {
    final _result = create();
    if (favoriteId != null) {
      _result.favoriteId = favoriteId;
    }
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory FavoriteReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FavoriteReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FavoriteReply clone() => FavoriteReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FavoriteReply copyWith(void Function(FavoriteReply) updates) => super.copyWith((message) => updates(message as FavoriteReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FavoriteReply create() => FavoriteReply._();
  FavoriteReply createEmptyInstance() => create();
  static $pb.PbList<FavoriteReply> createRepeated() => $pb.PbList<FavoriteReply>();
  @$core.pragma('dart2js:noInline')
  static FavoriteReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FavoriteReply>(create);
  static FavoriteReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get favoriteId => $_getIZ(0);
  @$pb.TagNumber(1)
  set favoriteId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFavoriteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFavoriteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get idiomId => $_getIZ(1);
  @$pb.TagNumber(2)
  set idiomId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdiomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdiomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get userId => $_getIZ(2);
  @$pb.TagNumber(3)
  set userId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);
}

class ReportReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReportReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reportId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..hasRequiredFields = false
  ;

  ReportReply._() : super();
  factory ReportReply({
    $core.int reportId,
    $core.int idiomId,
    $core.int userId,
    $core.String text,
  }) {
    final _result = create();
    if (reportId != null) {
      _result.reportId = reportId;
    }
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory ReportReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportReply clone() => ReportReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportReply copyWith(void Function(ReportReply) updates) => super.copyWith((message) => updates(message as ReportReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReportReply create() => ReportReply._();
  ReportReply createEmptyInstance() => create();
  static $pb.PbList<ReportReply> createRepeated() => $pb.PbList<ReportReply>();
  @$core.pragma('dart2js:noInline')
  static ReportReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportReply>(create);
  static ReportReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get reportId => $_getIZ(0);
  @$pb.TagNumber(1)
  set reportId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReportId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get idiomId => $_getIZ(1);
  @$pb.TagNumber(2)
  set idiomId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdiomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdiomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get userId => $_getIZ(2);
  @$pb.TagNumber(3)
  set userId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get text => $_getSZ(3);
  @$pb.TagNumber(4)
  set text($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);
}

class RequestTranslationReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestTranslationReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idiomId', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languageId', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RequestTranslationReply._() : super();
  factory RequestTranslationReply({
    $core.int requestId,
    $core.int idiomId,
    $core.int languageId,
    $core.int userId,
  }) {
    final _result = create();
    if (requestId != null) {
      _result.requestId = requestId;
    }
    if (idiomId != null) {
      _result.idiomId = idiomId;
    }
    if (languageId != null) {
      _result.languageId = languageId;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory RequestTranslationReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestTranslationReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestTranslationReply clone() => RequestTranslationReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestTranslationReply copyWith(void Function(RequestTranslationReply) updates) => super.copyWith((message) => updates(message as RequestTranslationReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestTranslationReply create() => RequestTranslationReply._();
  RequestTranslationReply createEmptyInstance() => create();
  static $pb.PbList<RequestTranslationReply> createRepeated() => $pb.PbList<RequestTranslationReply>();
  @$core.pragma('dart2js:noInline')
  static RequestTranslationReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestTranslationReply>(create);
  static RequestTranslationReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get requestId => $_getIZ(0);
  @$pb.TagNumber(1)
  set requestId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get idiomId => $_getIZ(1);
  @$pb.TagNumber(2)
  set idiomId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdiomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdiomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get languageId => $_getIZ(2);
  @$pb.TagNumber(3)
  set languageId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLanguageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLanguageId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get userId => $_getIZ(3);
  @$pb.TagNumber(4)
  set userId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);
}

class GetAllLanguagesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAllLanguagesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..pc<$1.LanguageReply>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languages', $pb.PbFieldType.PM, subBuilder: $1.LanguageReply.create)
    ..hasRequiredFields = false
  ;

  GetAllLanguagesResponse._() : super();
  factory GetAllLanguagesResponse({
    $core.Iterable<$1.LanguageReply> languages,
  }) {
    final _result = create();
    if (languages != null) {
      _result.languages.addAll(languages);
    }
    return _result;
  }
  factory GetAllLanguagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAllLanguagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAllLanguagesResponse clone() => GetAllLanguagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAllLanguagesResponse copyWith(void Function(GetAllLanguagesResponse) updates) => super.copyWith((message) => updates(message as GetAllLanguagesResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAllLanguagesResponse create() => GetAllLanguagesResponse._();
  GetAllLanguagesResponse createEmptyInstance() => create();
  static $pb.PbList<GetAllLanguagesResponse> createRepeated() => $pb.PbList<GetAllLanguagesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAllLanguagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAllLanguagesResponse>(create);
  static GetAllLanguagesResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.LanguageReply> get languages => $_getList(0);
}

class AddCommentLikeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddCommentLikeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentId', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isLike')
    ..hasRequiredFields = false
  ;

  AddCommentLikeRequest._() : super();
  factory AddCommentLikeRequest({
    $core.int commentId,
    $core.bool isLike,
  }) {
    final _result = create();
    if (commentId != null) {
      _result.commentId = commentId;
    }
    if (isLike != null) {
      _result.isLike = isLike;
    }
    return _result;
  }
  factory AddCommentLikeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCommentLikeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCommentLikeRequest clone() => AddCommentLikeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCommentLikeRequest copyWith(void Function(AddCommentLikeRequest) updates) => super.copyWith((message) => updates(message as AddCommentLikeRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddCommentLikeRequest create() => AddCommentLikeRequest._();
  AddCommentLikeRequest createEmptyInstance() => create();
  static $pb.PbList<AddCommentLikeRequest> createRepeated() => $pb.PbList<AddCommentLikeRequest>();
  @$core.pragma('dart2js:noInline')
  static AddCommentLikeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCommentLikeRequest>(create);
  static AddCommentLikeRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get commentId => $_getIZ(0);
  @$pb.TagNumber(1)
  set commentId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isLike => $_getBF(1);
  @$pb.TagNumber(2)
  set isLike($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsLike() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsLike() => clearField(2);
}

class AddCommentLikeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddCommentLikeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isSuccessful')
    ..hasRequiredFields = false
  ;

  AddCommentLikeResponse._() : super();
  factory AddCommentLikeResponse({
    $core.bool isSuccessful,
  }) {
    final _result = create();
    if (isSuccessful != null) {
      _result.isSuccessful = isSuccessful;
    }
    return _result;
  }
  factory AddCommentLikeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCommentLikeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCommentLikeResponse clone() => AddCommentLikeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCommentLikeResponse copyWith(void Function(AddCommentLikeResponse) updates) => super.copyWith((message) => updates(message as AddCommentLikeResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddCommentLikeResponse create() => AddCommentLikeResponse._();
  AddCommentLikeResponse createEmptyInstance() => create();
  static $pb.PbList<AddCommentLikeResponse> createRepeated() => $pb.PbList<AddCommentLikeResponse>();
  @$core.pragma('dart2js:noInline')
  static AddCommentLikeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCommentLikeResponse>(create);
  static AddCommentLikeResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSuccessful => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccessful($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsSuccessful() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccessful() => clearField(1);
}

class DeleteCommentLikeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteCommentLikeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commentId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DeleteCommentLikeRequest._() : super();
  factory DeleteCommentLikeRequest({
    $core.int commentId,
  }) {
    final _result = create();
    if (commentId != null) {
      _result.commentId = commentId;
    }
    return _result;
  }
  factory DeleteCommentLikeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentLikeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentLikeRequest clone() => DeleteCommentLikeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentLikeRequest copyWith(void Function(DeleteCommentLikeRequest) updates) => super.copyWith((message) => updates(message as DeleteCommentLikeRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteCommentLikeRequest create() => DeleteCommentLikeRequest._();
  DeleteCommentLikeRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentLikeRequest> createRepeated() => $pb.PbList<DeleteCommentLikeRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentLikeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentLikeRequest>(create);
  static DeleteCommentLikeRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get commentId => $_getIZ(0);
  @$pb.TagNumber(1)
  set commentId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);
}

class DeleteCommentLikeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteCommentLikeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'idiom'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRemoved')
    ..hasRequiredFields = false
  ;

  DeleteCommentLikeResponse._() : super();
  factory DeleteCommentLikeResponse({
    $core.bool isRemoved,
  }) {
    final _result = create();
    if (isRemoved != null) {
      _result.isRemoved = isRemoved;
    }
    return _result;
  }
  factory DeleteCommentLikeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCommentLikeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCommentLikeResponse clone() => DeleteCommentLikeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCommentLikeResponse copyWith(void Function(DeleteCommentLikeResponse) updates) => super.copyWith((message) => updates(message as DeleteCommentLikeResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteCommentLikeResponse create() => DeleteCommentLikeResponse._();
  DeleteCommentLikeResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteCommentLikeResponse> createRepeated() => $pb.PbList<DeleteCommentLikeResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteCommentLikeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCommentLikeResponse>(create);
  static DeleteCommentLikeResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isRemoved => $_getBF(0);
  @$pb.TagNumber(1)
  set isRemoved($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsRemoved() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsRemoved() => clearField(1);
}


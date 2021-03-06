///
//  Generated code. Do not modify.
//  source: action.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'action.pb.dart' as $0;
import 'models.pb.dart' as $1;
export 'action.pb.dart';

class ActionClient extends $grpc.Client {
  static final _$addUpvote =
      $grpc.ClientMethod<$0.AddUpvoteRequest, $0.UpvoteReply>(
          '/idiom.Action/AddUpvote',
          ($0.AddUpvoteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UpvoteReply.fromBuffer(value));
  static final _$deleteUpvote =
      $grpc.ClientMethod<$0.DeleteUpvoteRequest, $0.DeleteReply>(
          '/idiom.Action/DeleteUpvote',
          ($0.DeleteUpvoteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeleteReply.fromBuffer(value));
  static final _$addFavorite =
      $grpc.ClientMethod<$0.AddFavoriteRequest, $0.FavoriteReply>(
          '/idiom.Action/AddFavorite',
          ($0.AddFavoriteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FavoriteReply.fromBuffer(value));
  static final _$deleteFavorite =
      $grpc.ClientMethod<$0.DeleteFavoriteRequest, $0.DeleteReply>(
          '/idiom.Action/DeleteFavorite',
          ($0.DeleteFavoriteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeleteReply.fromBuffer(value));
  static final _$addReport =
      $grpc.ClientMethod<$0.AddReportRequest, $0.ReportReply>(
          '/idiom.Action/AddReport',
          ($0.AddReportRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ReportReply.fromBuffer(value));
  static final _$addComment =
      $grpc.ClientMethod<$0.AddCommentRequest, $1.CommentReply>(
          '/idiom.Action/AddComment',
          ($0.AddCommentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.CommentReply.fromBuffer(value));
  static final _$changeComment =
      $grpc.ClientMethod<$0.ChangeCommentRequest, $1.CommentReply>(
          '/idiom.Action/ChangeComment',
          ($0.ChangeCommentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.CommentReply.fromBuffer(value));
  static final _$deleteComment =
      $grpc.ClientMethod<$0.DeleteCommentRequest, $0.DeleteReply>(
          '/idiom.Action/DeleteComment',
          ($0.DeleteCommentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeleteReply.fromBuffer(value));
  static final _$requestTranslation = $grpc.ClientMethod<
          $0.RequestTranslationRequest, $0.RequestTranslationReply>(
      '/idiom.Action/RequestTranslation',
      ($0.RequestTranslationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RequestTranslationReply.fromBuffer(value));
  static final _$getAllLanguages =
      $grpc.ClientMethod<$0.GetAllLanguagesRequest, $0.GetAllLanguagesResponse>(
          '/idiom.Action/GetAllLanguages',
          ($0.GetAllLanguagesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetAllLanguagesResponse.fromBuffer(value));
  static final _$addCommentLike =
      $grpc.ClientMethod<$0.AddCommentLikeRequest, $0.AddCommentLikeResponse>(
          '/idiom.Action/AddCommentLike',
          ($0.AddCommentLikeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddCommentLikeResponse.fromBuffer(value));
  static final _$deleteCommentLike = $grpc.ClientMethod<
          $0.DeleteCommentLikeRequest, $0.DeleteCommentLikeResponse>(
      '/idiom.Action/DeleteCommentLike',
      ($0.DeleteCommentLikeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.DeleteCommentLikeResponse.fromBuffer(value));

  ActionClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UpvoteReply> addUpvote($0.AddUpvoteRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addUpvote, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteReply> deleteUpvote(
      $0.DeleteUpvoteRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteUpvote, request, options: options);
  }

  $grpc.ResponseFuture<$0.FavoriteReply> addFavorite(
      $0.AddFavoriteRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addFavorite, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteReply> deleteFavorite(
      $0.DeleteFavoriteRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteFavorite, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReportReply> addReport($0.AddReportRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addReport, request, options: options);
  }

  $grpc.ResponseFuture<$1.CommentReply> addComment($0.AddCommentRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addComment, request, options: options);
  }

  $grpc.ResponseFuture<$1.CommentReply> changeComment(
      $0.ChangeCommentRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$changeComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteReply> deleteComment(
      $0.DeleteCommentRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.RequestTranslationReply> requestTranslation(
      $0.RequestTranslationRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$requestTranslation, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetAllLanguagesResponse> getAllLanguages(
      $0.GetAllLanguagesRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getAllLanguages, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddCommentLikeResponse> addCommentLike(
      $0.AddCommentLikeRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addCommentLike, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteCommentLikeResponse> deleteCommentLike(
      $0.DeleteCommentLikeRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteCommentLike, request, options: options);
  }
}

abstract class ActionServiceBase extends $grpc.Service {
  $core.String get $name => 'idiom.Action';

  ActionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddUpvoteRequest, $0.UpvoteReply>(
        'AddUpvote',
        addUpvote_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddUpvoteRequest.fromBuffer(value),
        ($0.UpvoteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUpvoteRequest, $0.DeleteReply>(
        'DeleteUpvote',
        deleteUpvote_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteUpvoteRequest.fromBuffer(value),
        ($0.DeleteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddFavoriteRequest, $0.FavoriteReply>(
        'AddFavorite',
        addFavorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddFavoriteRequest.fromBuffer(value),
        ($0.FavoriteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteFavoriteRequest, $0.DeleteReply>(
        'DeleteFavorite',
        deleteFavorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteFavoriteRequest.fromBuffer(value),
        ($0.DeleteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddReportRequest, $0.ReportReply>(
        'AddReport',
        addReport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddReportRequest.fromBuffer(value),
        ($0.ReportReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddCommentRequest, $1.CommentReply>(
        'AddComment',
        addComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddCommentRequest.fromBuffer(value),
        ($1.CommentReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangeCommentRequest, $1.CommentReply>(
        'ChangeComment',
        changeComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ChangeCommentRequest.fromBuffer(value),
        ($1.CommentReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCommentRequest, $0.DeleteReply>(
        'DeleteComment',
        deleteComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteCommentRequest.fromBuffer(value),
        ($0.DeleteReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestTranslationRequest,
            $0.RequestTranslationReply>(
        'RequestTranslation',
        requestTranslation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestTranslationRequest.fromBuffer(value),
        ($0.RequestTranslationReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAllLanguagesRequest,
            $0.GetAllLanguagesResponse>(
        'GetAllLanguages',
        getAllLanguages_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetAllLanguagesRequest.fromBuffer(value),
        ($0.GetAllLanguagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddCommentLikeRequest,
            $0.AddCommentLikeResponse>(
        'AddCommentLike',
        addCommentLike_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddCommentLikeRequest.fromBuffer(value),
        ($0.AddCommentLikeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCommentLikeRequest,
            $0.DeleteCommentLikeResponse>(
        'DeleteCommentLike',
        deleteCommentLike_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteCommentLikeRequest.fromBuffer(value),
        ($0.DeleteCommentLikeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UpvoteReply> addUpvote_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddUpvoteRequest> request) async {
    return addUpvote(call, await request);
  }

  $async.Future<$0.DeleteReply> deleteUpvote_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteUpvoteRequest> request) async {
    return deleteUpvote(call, await request);
  }

  $async.Future<$0.FavoriteReply> addFavorite_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddFavoriteRequest> request) async {
    return addFavorite(call, await request);
  }

  $async.Future<$0.DeleteReply> deleteFavorite_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteFavoriteRequest> request) async {
    return deleteFavorite(call, await request);
  }

  $async.Future<$0.ReportReply> addReport_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddReportRequest> request) async {
    return addReport(call, await request);
  }

  $async.Future<$1.CommentReply> addComment_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddCommentRequest> request) async {
    return addComment(call, await request);
  }

  $async.Future<$1.CommentReply> changeComment_Pre($grpc.ServiceCall call,
      $async.Future<$0.ChangeCommentRequest> request) async {
    return changeComment(call, await request);
  }

  $async.Future<$0.DeleteReply> deleteComment_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteCommentRequest> request) async {
    return deleteComment(call, await request);
  }

  $async.Future<$0.RequestTranslationReply> requestTranslation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RequestTranslationRequest> request) async {
    return requestTranslation(call, await request);
  }

  $async.Future<$0.GetAllLanguagesResponse> getAllLanguages_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetAllLanguagesRequest> request) async {
    return getAllLanguages(call, await request);
  }

  $async.Future<$0.AddCommentLikeResponse> addCommentLike_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AddCommentLikeRequest> request) async {
    return addCommentLike(call, await request);
  }

  $async.Future<$0.DeleteCommentLikeResponse> deleteCommentLike_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteCommentLikeRequest> request) async {
    return deleteCommentLike(call, await request);
  }

  $async.Future<$0.UpvoteReply> addUpvote(
      $grpc.ServiceCall call, $0.AddUpvoteRequest request);
  $async.Future<$0.DeleteReply> deleteUpvote(
      $grpc.ServiceCall call, $0.DeleteUpvoteRequest request);
  $async.Future<$0.FavoriteReply> addFavorite(
      $grpc.ServiceCall call, $0.AddFavoriteRequest request);
  $async.Future<$0.DeleteReply> deleteFavorite(
      $grpc.ServiceCall call, $0.DeleteFavoriteRequest request);
  $async.Future<$0.ReportReply> addReport(
      $grpc.ServiceCall call, $0.AddReportRequest request);
  $async.Future<$1.CommentReply> addComment(
      $grpc.ServiceCall call, $0.AddCommentRequest request);
  $async.Future<$1.CommentReply> changeComment(
      $grpc.ServiceCall call, $0.ChangeCommentRequest request);
  $async.Future<$0.DeleteReply> deleteComment(
      $grpc.ServiceCall call, $0.DeleteCommentRequest request);
  $async.Future<$0.RequestTranslationReply> requestTranslation(
      $grpc.ServiceCall call, $0.RequestTranslationRequest request);
  $async.Future<$0.GetAllLanguagesResponse> getAllLanguages(
      $grpc.ServiceCall call, $0.GetAllLanguagesRequest request);
  $async.Future<$0.AddCommentLikeResponse> addCommentLike(
      $grpc.ServiceCall call, $0.AddCommentLikeRequest request);
  $async.Future<$0.DeleteCommentLikeResponse> deleteCommentLike(
      $grpc.ServiceCall call, $0.DeleteCommentLikeRequest request);
}

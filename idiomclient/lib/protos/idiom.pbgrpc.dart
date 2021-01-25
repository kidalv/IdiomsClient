///
//  Generated code. Do not modify.
//  source: Protos/idiom.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'idiom.pb.dart' as $0;
export 'idiom.pb.dart';

class IdiomClient extends $grpc.Client {
  static final _$getIdiomList =
      $grpc.ClientMethod<$0.GetIdiomListRequest, $0.GetIdiomListReply>(
          '/idiom.Idiom/GetIdiomList',
          ($0.GetIdiomListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetIdiomListReply.fromBuffer(value));
  static final _$getIdiomInfo =
      $grpc.ClientMethod<$0.GetIdiomInfoRequest, $0.GetIdiomInfoReply>(
          '/idiom.Idiom/GetIdiomInfo',
          ($0.GetIdiomInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetIdiomInfoReply.fromBuffer(value));
  static final _$addIdiom =
      $grpc.ClientMethod<$0.AddIdiomRequest, $0.GetIdiomInfoReply>(
          '/idiom.Idiom/AddIdiom',
          ($0.AddIdiomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetIdiomInfoReply.fromBuffer(value));
  static final _$changeIdiom =
      $grpc.ClientMethod<$0.ChangeIdiomRequest, $0.GetIdiomInfoReply>(
          '/idiom.Idiom/ChangeIdiom',
          ($0.ChangeIdiomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetIdiomInfoReply.fromBuffer(value));
  static final _$deleteIdiom =
      $grpc.ClientMethod<$0.DeleteIdiomRequest, $0.DeleteIdiomReply>(
          '/idiom.Idiom/DeleteIdiom',
          ($0.DeleteIdiomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteIdiomReply.fromBuffer(value));

  IdiomClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetIdiomListReply> getIdiomList(
      $0.GetIdiomListRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getIdiomList, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetIdiomInfoReply> getIdiomInfo(
      $0.GetIdiomInfoRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getIdiomInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetIdiomInfoReply> addIdiom(
      $0.AddIdiomRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addIdiom, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetIdiomInfoReply> changeIdiom(
      $0.ChangeIdiomRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$changeIdiom, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteIdiomReply> deleteIdiom(
      $0.DeleteIdiomRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteIdiom, request, options: options);
  }
}

abstract class IdiomServiceBase extends $grpc.Service {
  $core.String get $name => 'idiom.Idiom';

  IdiomServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetIdiomListRequest, $0.GetIdiomListReply>(
            'GetIdiomList',
            getIdiomList_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetIdiomListRequest.fromBuffer(value),
            ($0.GetIdiomListReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetIdiomInfoRequest, $0.GetIdiomInfoReply>(
            'GetIdiomInfo',
            getIdiomInfo_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetIdiomInfoRequest.fromBuffer(value),
            ($0.GetIdiomInfoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddIdiomRequest, $0.GetIdiomInfoReply>(
        'AddIdiom',
        addIdiom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddIdiomRequest.fromBuffer(value),
        ($0.GetIdiomInfoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangeIdiomRequest, $0.GetIdiomInfoReply>(
        'ChangeIdiom',
        changeIdiom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ChangeIdiomRequest.fromBuffer(value),
        ($0.GetIdiomInfoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteIdiomRequest, $0.DeleteIdiomReply>(
        'DeleteIdiom',
        deleteIdiom_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteIdiomRequest.fromBuffer(value),
        ($0.DeleteIdiomReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetIdiomListReply> getIdiomList_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetIdiomListRequest> request) async {
    return getIdiomList(call, await request);
  }

  $async.Future<$0.GetIdiomInfoReply> getIdiomInfo_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetIdiomInfoRequest> request) async {
    return getIdiomInfo(call, await request);
  }

  $async.Future<$0.GetIdiomInfoReply> addIdiom_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddIdiomRequest> request) async {
    return addIdiom(call, await request);
  }

  $async.Future<$0.GetIdiomInfoReply> changeIdiom_Pre($grpc.ServiceCall call,
      $async.Future<$0.ChangeIdiomRequest> request) async {
    return changeIdiom(call, await request);
  }

  $async.Future<$0.DeleteIdiomReply> deleteIdiom_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteIdiomRequest> request) async {
    return deleteIdiom(call, await request);
  }

  $async.Future<$0.GetIdiomListReply> getIdiomList(
      $grpc.ServiceCall call, $0.GetIdiomListRequest request);
  $async.Future<$0.GetIdiomInfoReply> getIdiomInfo(
      $grpc.ServiceCall call, $0.GetIdiomInfoRequest request);
  $async.Future<$0.GetIdiomInfoReply> addIdiom(
      $grpc.ServiceCall call, $0.AddIdiomRequest request);
  $async.Future<$0.GetIdiomInfoReply> changeIdiom(
      $grpc.ServiceCall call, $0.ChangeIdiomRequest request);
  $async.Future<$0.DeleteIdiomReply> deleteIdiom(
      $grpc.ServiceCall call, $0.DeleteIdiomRequest request);
}

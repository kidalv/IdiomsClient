///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user.pb.dart' as $0;
export 'user.pb.dart';

class UserClient extends $grpc.Client {
  static final _$getUserProfile =
      $grpc.ClientMethod<$0.GetUserProfileRequest, $0.UserProfileReply>(
          '/idiom.User/GetUserProfile',
          ($0.GetUserProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserProfileReply.fromBuffer(value));
  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.UserCredentialsReply>(
          '/idiom.User/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserCredentialsReply.fromBuffer(value));
  static final _$login =
      $grpc.ClientMethod<$0.LoginRequest, $0.UserCredentialsReply>(
          '/idiom.User/Login',
          ($0.LoginRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserCredentialsReply.fromBuffer(value));
  static final _$changeUser =
      $grpc.ClientMethod<$0.ChangeUserRequest, $0.UserProfileReply>(
          '/idiom.User/ChangeUser',
          ($0.ChangeUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserProfileReply.fromBuffer(value));
  static final _$addUserLangueage =
      $grpc.ClientMethod<$0.AddUserLanguageRequest, $0.UserProfileReply>(
          '/idiom.User/AddUserLangueage',
          ($0.AddUserLanguageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserProfileReply.fromBuffer(value));
  static final _$deleteUserLanguage =
      $grpc.ClientMethod<$0.DeleteUserLanguageRequest, $0.UserProfileReply>(
          '/idiom.User/DeleteUserLanguage',
          ($0.DeleteUserLanguageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserProfileReply.fromBuffer(value));

  UserClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserProfileReply> getUserProfile(
      $0.GetUserProfileRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$getUserProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserCredentialsReply> register(
      $0.RegisterRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserCredentialsReply> login($0.LoginRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserProfileReply> changeUser(
      $0.ChangeUserRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$changeUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserProfileReply> addUserLangueage(
      $0.AddUserLanguageRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$addUserLangueage, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserProfileReply> deleteUserLanguage(
      $0.DeleteUserLanguageRequest request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$deleteUserLanguage, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'idiom.User';

  UserServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetUserProfileRequest, $0.UserProfileReply>(
            'GetUserProfile',
            getUserProfile_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetUserProfileRequest.fromBuffer(value),
            ($0.UserProfileReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.UserCredentialsReply>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.UserCredentialsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.UserCredentialsReply>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.UserCredentialsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangeUserRequest, $0.UserProfileReply>(
        'ChangeUser',
        changeUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChangeUserRequest.fromBuffer(value),
        ($0.UserProfileReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AddUserLanguageRequest, $0.UserProfileReply>(
            'AddUserLangueage',
            addUserLangueage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AddUserLanguageRequest.fromBuffer(value),
            ($0.UserProfileReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteUserLanguageRequest, $0.UserProfileReply>(
            'DeleteUserLanguage',
            deleteUserLanguage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteUserLanguageRequest.fromBuffer(value),
            ($0.UserProfileReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserProfileReply> getUserProfile_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetUserProfileRequest> request) async {
    return getUserProfile(call, await request);
  }

  $async.Future<$0.UserCredentialsReply> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.UserCredentialsReply> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.UserProfileReply> changeUser_Pre($grpc.ServiceCall call,
      $async.Future<$0.ChangeUserRequest> request) async {
    return changeUser(call, await request);
  }

  $async.Future<$0.UserProfileReply> addUserLangueage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AddUserLanguageRequest> request) async {
    return addUserLangueage(call, await request);
  }

  $async.Future<$0.UserProfileReply> deleteUserLanguage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteUserLanguageRequest> request) async {
    return deleteUserLanguage(call, await request);
  }

  $async.Future<$0.UserProfileReply> getUserProfile(
      $grpc.ServiceCall call, $0.GetUserProfileRequest request);
  $async.Future<$0.UserCredentialsReply> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.UserCredentialsReply> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.UserProfileReply> changeUser(
      $grpc.ServiceCall call, $0.ChangeUserRequest request);
  $async.Future<$0.UserProfileReply> addUserLangueage(
      $grpc.ServiceCall call, $0.AddUserLanguageRequest request);
  $async.Future<$0.UserProfileReply> deleteUserLanguage(
      $grpc.ServiceCall call, $0.DeleteUserLanguageRequest request);
}

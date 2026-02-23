// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      userId: (json['user_id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      accountNumber: (json['accountNumber'] as num?)?.toInt(),
      userEmail: json['user_email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'accountNumber': instance.accountNumber,
      'user_email': instance.userEmail,
      'password': instance.password,
    };

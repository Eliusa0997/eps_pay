// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      userId: (json['user_id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      accountNumber: (json['accountNumber'] as num?)?.toInt(),
      userEmail: json['user_email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'accountNumber': instance.accountNumber,
      'user_email': instance.userEmail,
      'password': instance.password,
    };

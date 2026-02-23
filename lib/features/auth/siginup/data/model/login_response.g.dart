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

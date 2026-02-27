// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  userName: json['username'] as String?,
  accountNumber: (json['account_number'] as num?)?.toInt(),
  balance: json['balance'] as String?,
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'account_number': instance.accountNumber,
      'balance': instance.balance,
    };

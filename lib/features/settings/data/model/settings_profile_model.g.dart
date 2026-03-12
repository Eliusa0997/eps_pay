// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsProfileModel _$SettingsProfileModelFromJson(
  Map<String, dynamic> json,
) => SettingsProfileModel(
  userName: json['username'] as String?,
  accountNumber: (json['account_number'] as num?)?.toInt(),
  balance: json['balance'] as String?,
  fullName: json['full_name'] as String?,
  email: json['email'] as String?,
  joinAt: DateTime.parse(json['date_joined'] as String),
);

Map<String, dynamic> _$SettingsProfileModelToJson(
  SettingsProfileModel instance,
) => <String, dynamic>{
  'username': instance.userName,
  'full_name': instance.fullName,
  'email': instance.email,
  'account_number': instance.accountNumber,
  'date_joined': instance.joinAt.toIso8601String(),
  'balance': instance.balance,
};

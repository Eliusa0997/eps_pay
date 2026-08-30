// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciver_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReciverResponse _$ReciverResponseFromJson(Map<String, dynamic> json) =>
    ReciverResponse(
      reciverName: json['username'] as String?,
      accountNumber: (json['account_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReciverResponseToJson(ReciverResponse instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'username': instance.reciverName,
    };

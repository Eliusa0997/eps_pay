// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciver_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReciverRequestBody _$ReciverRequestBodyFromJson(Map<String, dynamic> json) =>
    ReciverRequestBody(
      accountNumber: (json['account_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReciverRequestBodyToJson(ReciverRequestBody instance) =>
    <String, dynamic>{'account_number': instance.accountNumber};

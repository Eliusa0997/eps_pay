// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferRequestBody _$TransferRequestBodyFromJson(Map<String, dynamic> json) =>
    TransferRequestBody(
      accountNumber: json['account_number'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$TransferRequestBodyToJson(
  TransferRequestBody instance,
) => <String, dynamic>{
  'account_number': instance.accountNumber,
  'amount': instance.amount,
};

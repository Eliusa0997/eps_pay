// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryResponseModel _$TransactionHistoryResponseModelFromJson(
  Map<String, dynamic> json,
) => TransactionHistoryResponseModel(
  id: (json['id'] as num).toInt(),
  transactionType: json['transaction_type'] as String,
  amount: json['amount'] as String,
  date: DateTime.parse(json['timestamp'] as String),
  receiverName: json['receiver_full_name'] as String?,
  senderFullName: json['sender_full_name'] as String?,
);

Map<String, dynamic> _$TransactionHistoryResponseModelToJson(
  TransactionHistoryResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transaction_type': instance.transactionType,
  'amount': instance.amount,
  'timestamp': instance.date.toIso8601String(),
  'sender_full_name': instance.senderFullName,
  'receiver_full_name': instance.receiverName,
};

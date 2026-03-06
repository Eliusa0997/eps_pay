// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryModel _$TransactionHistoryModelFromJson(
  Map<String, dynamic> json,
) => TransactionHistoryModel(
  id: (json['id'] as num).toInt(),
  transactionType: json['transaction_type'] as String,
  amount: json['amount'] as String,
  date: DateTime.parse(json['timestamp'] as String),
  profile: (json['profile'] as num).toInt(),
);

Map<String, dynamic> _$TransactionHistoryModelToJson(
  TransactionHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transaction_type': instance.transactionType,
  'amount': instance.amount,
  'timestamp': instance.date.toIso8601String(),
  'profile': instance.profile,
};

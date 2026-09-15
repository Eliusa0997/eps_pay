// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillPaymentResponse _$BillPaymentResponseFromJson(Map<String, dynamic> json) =>
    BillPaymentResponse(
      transactionType: json['transaction_type'] as String,
      amount: json['amount'] as String,
      date: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$BillPaymentResponseToJson(
  BillPaymentResponse instance,
) => <String, dynamic>{
  'transaction_type': instance.transactionType,
  'amount': instance.amount,
  'timestamp': instance.date.toIso8601String(),
};

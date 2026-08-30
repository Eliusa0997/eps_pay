// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  userName: json['username'] as String?,
  accountNumber: (json['account_number'] as num?)?.toInt(),
  balance: json['balance'] as String?,
  recentTransactions: (json['recent_transactions'] as List<dynamic>)
      .map((e) => RecentTransactions.fromJson(e as Map<String, dynamic>))
      .toList(),
  fullName: json['full_name'] as String?,
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'full_name': instance.fullName,
      'account_number': instance.accountNumber,
      'balance': instance.balance,
      'recent_transactions': instance.recentTransactions,
    };

RecentTransactions _$RecentTransactionsFromJson(Map<String, dynamic> json) =>
    RecentTransactions(
      id: (json['id'] as num).toInt(),
      transactionType: json['transaction_type'] as String,
      amount: json['amount'] as String,
      date: DateTime.parse(json['timestamp'] as String),
      receiverName: json['receiver_full_name'] as String?,
      senderFullName: json['sender_full_name'] as String?,
    );

Map<String, dynamic> _$RecentTransactionsToJson(RecentTransactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_type': instance.transactionType,
      'amount': instance.amount,
      'timestamp': instance.date.toIso8601String(),
      'sender_full_name': instance.senderFullName,
      'receiver_full_name': instance.receiverName,
    };

import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "username")
  final String? userName;
  @JsonKey(name: "full_name")
  final String? fullName;
  @JsonKey(name: "account_number")
  final int? accountNumber;
  final String? balance;
  @JsonKey(name: "recent_transactions")
  List<RecentTransactions> recentTransactions;

  ProfileModel({
    required this.userName,
    required this.accountNumber,
    required this.balance,
    required this.recentTransactions,
    required this.fullName,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@JsonSerializable()
class RecentTransactions {
  final int id;
  @JsonKey(name: "transaction_type")
  final String transactionType;
  final String amount;
  @JsonKey(name: "timestamp")
  final DateTime date;
  @JsonKey(name: "sender_full_name")
  final String? senderFullName;
  @JsonKey(name: "receiver_full_name")
  final String? receiverName;

  RecentTransactions({
    required this.id,
    required this.transactionType,
    required this.amount,
    required this.date,
    this.receiverName,
    this.senderFullName,
  });

  factory RecentTransactions.fromJson(Map<String, dynamic> json) =>
      _$RecentTransactionsFromJson(json);
}

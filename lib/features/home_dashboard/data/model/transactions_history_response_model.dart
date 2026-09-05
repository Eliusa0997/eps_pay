import 'package:json_annotation/json_annotation.dart';

part 'transactions_history_response_model.g.dart';

@JsonSerializable()
class TransactionHistoryResponseModel {
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

  TransactionHistoryResponseModel({
    required this.id,
    required this.transactionType,
    required this.amount,
    required this.date,
    this.receiverName,
    this.senderFullName,
  });

  factory TransactionHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TransactionHistoryResponseModelToJson(this);
}

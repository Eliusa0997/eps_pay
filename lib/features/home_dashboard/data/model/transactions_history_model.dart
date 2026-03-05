import 'package:json_annotation/json_annotation.dart';

part 'transactions_history_model.g.dart';

@JsonSerializable()
class TransactionHistoryModel {
  final String id;
   @JsonKey(name: "transaction_type")
  final String transactionType;
  final String amount;
  @JsonKey(name: "timestamp")
  final String transactionDate;

    TransactionHistoryModel({
    required this.id,
    required this.transactionType,
    required this.amount,
    required this.transactionDate,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionHistoryModelToJson(this);
}   
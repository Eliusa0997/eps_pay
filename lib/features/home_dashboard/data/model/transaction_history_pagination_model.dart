import 'package:json_annotation/json_annotation.dart';
import 'transactions_history_response_model.dart';

part 'transaction_history_pagination_model.g.dart';

@JsonSerializable()
class TransactionHistoryPaginationModel {
  final int count;

  final String? next;

  final String? previous;

  final List<TransactionHistoryResponseModel> results;

  TransactionHistoryPaginationModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory TransactionHistoryPaginationModel.fromJson(
    Map<String, dynamic> json,
  ) => _$TransactionHistoryPaginationModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TransactionHistoryPaginationModelToJson(this);
}

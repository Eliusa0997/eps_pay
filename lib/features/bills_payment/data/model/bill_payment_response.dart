import 'package:json_annotation/json_annotation.dart';
part 'bill_payment_response.g.dart';

@JsonSerializable()
class BillPaymentResponse {
  @JsonKey(name: "transaction_type")
  final String transactionType;
  final String amount;
  @JsonKey(name: "timestamp")
  final DateTime date;

  BillPaymentResponse({
    required this.transactionType,
    required this.amount,
    required this.date,
  });

  factory BillPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$BillPaymentResponseFromJson(json);
}

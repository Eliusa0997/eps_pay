import 'package:json_annotation/json_annotation.dart';
part 'transfer_request_body.g.dart';

@JsonSerializable()
class TransferRequestBody {
  @JsonKey(name: "account_number")
  final String? accountNumber;
  final String? amount;

  TransferRequestBody({this.accountNumber, this.amount});
  factory TransferRequestBody.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$TransferRequestBodyToJson(this);
}

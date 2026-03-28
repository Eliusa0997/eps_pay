import 'package:json_annotation/json_annotation.dart';
part 'bills_request_body.g.dart';

@JsonSerializable()
class BillsRequestBody {
  final String? amount;

  BillsRequestBody({this.amount});
  factory BillsRequestBody.fromJson(Map<String, dynamic> json) =>
      _$BillsRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$BillsRequestBodyToJson(this);
}

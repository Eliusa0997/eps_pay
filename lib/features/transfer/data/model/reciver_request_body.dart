import 'package:json_annotation/json_annotation.dart';
part 'reciver_request_body.g.dart';

@JsonSerializable()
class ReciverRequestBody {
  @JsonKey(name: "account_number")
  final int? accountNumber;

  ReciverRequestBody({this.accountNumber});
  factory ReciverRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ReciverRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ReciverRequestBodyToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'reciver_response.g.dart';

@JsonSerializable()
class ReciverResponse {
  @JsonKey(name: "account_number")
  final int? accountNumber;
  @JsonKey(name: "username")
  final String? reciverName;

  ReciverResponse({this.reciverName, this.accountNumber});
  factory ReciverResponse.fromJson(Map<String, dynamic> json) =>
      _$ReciverResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReciverResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'bills_response.g.dart';

@JsonSerializable()
class BillsResponse {
  @JsonKey(name: "message")
  final String? sucsuccessMessage;

  BillsResponse({this.sucsuccessMessage});
  factory BillsResponse.fromJson(Map<String, dynamic> json) =>
      _$BillsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BillsResponseToJson(this);
}

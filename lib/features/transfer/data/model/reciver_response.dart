import 'package:json_annotation/json_annotation.dart';
part 'reciver_response.g.dart';

@JsonSerializable()
class ReciverResponse {
  @JsonKey(name: "user_name")
  final String? resiverName;

  ReciverResponse({this.resiverName});
  factory ReciverResponse.fromJson(Map<String, dynamic> json) =>
      _$ReciverResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReciverResponseToJson(this);
}

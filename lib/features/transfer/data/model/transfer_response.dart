import 'package:json_annotation/json_annotation.dart';
part 'transfer_response.g.dart';

@JsonSerializable()
class TransferRespone {
  @JsonKey(name: "message")
  final String? sucsuccessMessage;

  TransferRespone({this.sucsuccessMessage});
  factory TransferRespone.fromJson(Map<String, dynamic> json) =>
      _$TransferResponeFromJson(json);
  Map<String, dynamic> toJson() => _$TransferResponeToJson(this);
}

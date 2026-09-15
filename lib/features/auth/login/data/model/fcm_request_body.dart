import 'package:json_annotation/json_annotation.dart';
part 'fcm_request_body.g.dart';

@JsonSerializable()
class FcmRequestBody {
  @JsonKey(name: "fcm_token")
  final String? fcmToken;

  FcmRequestBody({this.fcmToken});
  factory FcmRequestBody.fromJson(Map<String, dynamic> json) =>
      _$FcmRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$FcmRequestBodyToJson(this);
}

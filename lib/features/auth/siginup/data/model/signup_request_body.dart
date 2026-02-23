import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  @JsonKey(name: "username")
  final String? userName;
  final String? password;

  SignupRequestBody({this.userName, this.password});
  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}

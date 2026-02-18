import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  @JsonKey(name: "user_email")
  final String? userEmail;
  final String? password;

  LoginRequestBody({this.userEmail, this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}

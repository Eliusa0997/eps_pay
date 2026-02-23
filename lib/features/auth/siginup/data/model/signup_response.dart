import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "user_name")
  final String? userName;
  final int? accountNumber;
  @JsonKey(name: "user_email")
  final String? userEmail;
  final String? password;

  SignupResponse({
    this.userId,
    this.userName,
    this.accountNumber,
    this.userEmail,
    this.password,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

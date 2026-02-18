import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "user_name")
  final String? userName;
  final int? accountNumber;
  @JsonKey(name: "user_email")
  final String? userEmail;
  final String? password;

  LoginResponse({
    this.userId,
    this.userName,
    this.accountNumber,
    this.userEmail,
    this.password,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

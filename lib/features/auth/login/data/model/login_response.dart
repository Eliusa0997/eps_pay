import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "refresh")
  final int? refreshToken;
  @JsonKey(name: "access")
  final String? accessToken;

  LoginResponse({this.refreshToken, this.accessToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

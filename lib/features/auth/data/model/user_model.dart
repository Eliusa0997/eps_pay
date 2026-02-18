import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "user_name")
  final String? userName;
  final int? accountNumber;
  @JsonKey(name: "user_email")
  final String? userEmail;
  final String? password;

  UserModel({
    this.userId,
    this.userName,
    this.accountNumber,
    this.userEmail,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

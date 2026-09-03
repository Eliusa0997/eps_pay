import 'package:json_annotation/json_annotation.dart';
part 'settings_profile_model.g.dart';

@JsonSerializable()
class SettingsProfileModel {
  @JsonKey(name: "username")
  final String? userName;
  @JsonKey(name: "full_name")
  final String? fullName;
  final String? email;
  @JsonKey(name: "account_number")
  final int? accountNumber;
  @JsonKey(name: "date_joined")
  final DateTime joinAt;
  final String? balance;

  SettingsProfileModel({
    required this.userName,
    required this.accountNumber,
    required this.balance,
    required this.fullName,
    required this.email,
    required this.joinAt,
  });

  factory SettingsProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsProfileModelFromJson(json);
}

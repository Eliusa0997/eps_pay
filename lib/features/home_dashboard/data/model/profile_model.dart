import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "username")
  final String? userName;
  @JsonKey(name: "account_number")
  final int? accountNumber;
  final String? balance;

  ProfileModel({this.userName, this.accountNumber, this.balance});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

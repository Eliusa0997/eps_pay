import 'package:json_annotation/json_annotation.dart';
part 'login_error_model.g.dart';

@JsonSerializable()
class LoginErrorModel {
  @JsonKey(name: "detail")
  final String? errorDetails;

  LoginErrorModel({this.errorDetails});
  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      _$LoginErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginErrorModelToJson(this);
}

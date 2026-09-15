import 'package:json_annotation/json_annotation.dart';
part 'fcm_response.g.dart';

@JsonSerializable()
class FcmResponse {
  final String? message;

  FcmResponse({this.message});

  factory FcmResponse.fromJson(Map<String, dynamic> json) =>
      _$FcmResponseFromJson(json);
}

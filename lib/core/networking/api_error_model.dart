class ApiErrorModel {
  final String? message;

  ApiErrorModel({this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModel(json);
}

import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  // late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      switch (error.type) {
        case DioException.connectionError:
          return ApiErrorModel(message: "Connecction to server failed");
        case DioException.requestCancelled:
          return ApiErrorModel(message: "Request to server cancelled");
        case DioException.connectionTimeout:
          return ApiErrorModel(message: "Connecction timeout with the server");
        case DioException.receiveTimeout:
          return ApiErrorModel(
            message: "Recevie timeout  in connection with the server",
          );
        case DioException.sendTimeout:
          return ApiErrorModel(
            message: "Send timeout  in connection with the server",
          );
        case DioException.badResponse:
          return _handleError();
        default:
          return ApiErrorModel(message: "Some thing went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unexpected error");
    }
  }

  ApiErrorModel _handleError() {}
}

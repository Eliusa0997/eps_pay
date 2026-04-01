import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  // late ApiErrorModel apiErrorModel;

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      switch (error.type) {
        case DioException.connectionError:
          return ApiErrorModel(detail: "Connecction to server failed");
        case DioException.requestCancelled:
          return ApiErrorModel(detail: "Request to server cancelled");
        case DioException.connectionTimeout:
          return ApiErrorModel(detail: "Connecction timeout with the server");
        case DioException.receiveTimeout:
          return ApiErrorModel(
            detail: "Recevie timeout  in connection with the server",
          );
        case DioException.sendTimeout:
          return ApiErrorModel(
            detail: "Send timeout  in connection with the server",
          );
        case DioException.badResponse:
          return _handleError(dynamic errorDetail);
        default:
          return ApiErrorModel(detail: "Some thing went wrong");
      }
    } else {
      return ApiErrorModel(detail: "Unexpected error");
    }
  }

  ApiErrorModel _handleError(dynamic errorDetail) {
    return ApiErrorModel(detail: errorDetail);
  }
}

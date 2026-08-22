// import 'package:dio/dio.dart';

// import 'api_error_model.dart';

// class ApiErrorHandler {
//   // late ApiErrorModel apiErrorModel;

//   static ApiErrorModel handle(dynamic error) {
//     if (error is DioException) {
//       // dio error so its an error from response of the API or from dio itself
//       switch (error.type) {
//         case DioException.connectionError:
//           return ApiErrorModel(detail: "Connecction to server failed");
//         case DioException.requestCancelled:
//           return ApiErrorModel(detail: "Request to server cancelled");
//         case DioException.connectionTimeout:
//           return ApiErrorModel(detail: "Connecction timeout with the server");
//         case DioException.receiveTimeout:
//           return ApiErrorModel(
//             detail: "Recevie timeout  in connection with the server",
//           );
//         case DioException.sendTimeout:
//           return ApiErrorModel(
//             detail: "Send timeout  in connection with the server",
//           );
//         case DioException.badResponse:
//           return _handleError(error);
//         default:
//           return ApiErrorModel(detail: "Obs Some thing went wrong");
//       }
//     } else {
//       return ApiErrorModel(detail: "Unexpected error");
//     }
//   }
// }

// ApiErrorModel _handleError(dynamic error) {
//   return ApiErrorModel(detail: error);
// }

import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      print("DioException type: ${error.type}");
      print("DioException response: ${error.response}");
      print("DioException response data: ${error.response?.data}");

      // Try to extract detail FIRST, before checking error type
      if (error.response?.data != null) {
        final data = error.response!.data;
        if (data is Map<String, dynamic> && data.containsKey('detail')) {
          print("✅ Found detail directly in response");
          return ApiErrorModel(detail: data['detail']?.toString());
        }
      }

      // Now handle based on error type - use .toString() for comparison
      switch (error.type.toString()) {
        case 'DioExceptionType.connectionError':
          return ApiErrorModel(detail: "Connection to server failed");
        case 'DioExceptionType.requestCancelled':
          return ApiErrorModel(detail: "Request to server cancelled");
        case 'DioExceptionType.connectionTimeout':
          return ApiErrorModel(detail: "Connection timeout with the server");
        case 'DioExceptionType.receiveTimeout':
          return ApiErrorModel(
            detail: "Receive timeout in connection with the server",
          );
        case 'DioExceptionType.sendTimeout':
          return ApiErrorModel(
            detail: "Send timeout in connection with the server",
          );
        case 'DioExceptionType.badResponse':
          print("✅ Entered badResponse case");
          return _handleBadResponse(error);
        default:
          print("❌ Entered default case for type: ${error.type}");
          // One more attempt to extract detail
          if (error.response?.data is Map<String, dynamic>) {
            final data = error.response!.data as Map<String, dynamic>;
            if (data.containsKey('detail')) {
              return ApiErrorModel(detail: data['detail']?.toString());
            }
          }
          return ApiErrorModel(detail: "Oops! Something went wrong");
      }
    } else {
      return ApiErrorModel(detail: "Unexpected error occurred");
    }
  }

  static ApiErrorModel _handleBadResponse(DioException error) {
    try {
      final response = error.response;
      print("🔍 Handling bad response");

      if (response?.data != null) {
        final data = response!.data;

        if (data is Map<String, dynamic>) {
          if (data.containsKey('detail')) {
            final message = data['detail']?.toString();
            print("✅ Found detail: $message");
            return ApiErrorModel(detail: message);
          }

          final message =
              data['message'] ??
              data['error'] ??
              data['msg'] ??
              response.statusMessage;

          return ApiErrorModel(
            detail: message?.toString() ?? "Server error occurred",
          );
        } else if (data is String) {
          return ApiErrorModel(detail: data);
        }
      }

      return ApiErrorModel(
        detail: error.response?.statusMessage ?? "Server error occurred",
      );
    } catch (e) {
      return ApiErrorModel(detail: "Failed to parse error response");
    }
  }
}

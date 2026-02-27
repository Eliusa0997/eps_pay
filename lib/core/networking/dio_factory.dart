import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static final FlutterSecureStorage _storage = FlutterSecureStorage();
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Get token from secure storage
          String? token = await _storage.read(key: 'access_token');

          if (token != null && token.isNotEmpty) {
            // Add token to headers
            options.headers['Authorization'] = 'Bearer $token';
            print('✅ Token added to request: Bearer $token');
          } else {
            print('⚠️ No token found in secure storage');
          }

          return handler.next(options);
        },
        // onError: (error, handler) async {
        //   // Handle 401 errors - token expired
        //   if (error.response?.statusCode == 401) {
        //     print('🔄 Token expired, trying to refresh...');

        //     try {
        //       // Try to refresh token
        //       String? newToken = await _refreshToken();

        //       if (newToken != null) {
        //         // Retry the request with new token
        //         error.requestOptions.headers['Authorization'] = 'Bearer $newToken';

        //         // Create new request with updated token
        //         final response = await dio?.fetch(error.requestOptions);
        //         return handler.resolve(response!);
        //       }
        //     } catch (e) {
        //       print('❌ Token refresh failed: $e');
        //       // Clear storage and redirect to login
        //       await _storage.delete(key: 'access_token');
        //       await _storage.delete(key: 'refresh_token');
        //     }
        //   }
        //   return handler.next(error);
        // },
        onResponse: (response, handler) {
          // Optional: Handle responses if needed
          return handler.next(response);
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}

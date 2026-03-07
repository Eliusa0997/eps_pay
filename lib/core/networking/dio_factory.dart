import 'package:dio/dio.dart';
import 'package:eps_pay/core/networking/api_constant.dart';
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

          if (token != null &&
              token.isNotEmpty &&
              !options.path.contains(ApiConstant.login) &&
              !options.path.contains(ApiConstant.signup)) {
            // Add token to headers
            options.headers['Authorization'] = 'Bearer $token';
            print('✅ Token added to request: Bearer $token');
          } else {
            print('⚠️ No token found in secure storage');
          }

          return handler.next(options);
        },
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

import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/auth/login/data/model/login_error_model.dart';
import 'package:eps_pay/features/auth/login/data/model/login_request_body.dart';
import 'package:eps_pay/features/auth/login/data/model/login_response.dart';

class LoginRepo {
  // Create storage

  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

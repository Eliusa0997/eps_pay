import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/auth/login/data/model/fcm_request_body.dart';
import 'package:eps_pay/features/auth/login/data/model/fcm_response.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';

class FcmRepo {
  final ApiService _apiService;
  FcmRepo(this._apiService);

  Future<ApiResult<FcmResponse>> sendFcmTokenToServer(
    FcmRequestBody fcmRequestBody,
  ) async {
    try {
      final response = await _apiService.sendFcm(fcmRequestBody);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

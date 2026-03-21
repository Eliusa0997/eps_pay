import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/auth/login/data/model/fcm_request_body.dart';
import 'package:eps_pay/features/auth/login/data/model/fcm_response.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);
  Future<ApiResult<ProfileModel>> getProileData() async {
    try {
      final response = await _apiService.getProfileData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<FcmResponse>> sendFcmTokenToServer(
    FcmRequestBody fcmRequestBody,
  ) async {
    try {
      final response = await _apiService.sendFcmTokenToServer(fcmRequestBody);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

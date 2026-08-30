import 'package:eps_pay/core/networking/api_error_handler.dart';
import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/auth/login/data/model/fcm_request_body.dart';
import 'package:eps_pay/features/auth/login/data/model/fcm_response.dart';
import 'package:eps_pay/features/settings/data/model/settings_profile_model.dart';

class SettingsRepo {
  final ApiService _apiService;
  SettingsRepo(this._apiService);
  Future<ApiResult<SettingsProfileModel>> getSettingsProfileData() async {
    try {
      final response = await _apiService.getSettingsProfileData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

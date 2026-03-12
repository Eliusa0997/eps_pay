import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/settings/data/model/settings_profile_model.dart';

class SettingsRepo {
  final ApiService _apiService;
  SettingsRepo(this._apiService);
  Future<ApiResult<SettingsProfileModel>> getSettingsProfileData() async {
    try {
      final response = await _apiService.getSettingsProfileData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

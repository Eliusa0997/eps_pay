import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';

class TransferRepo {
  final ApiService _apiService;
  TransferRepo(this._apiService);
  // Future<ApiResult<ProfileModel>> getProileData() async {
  //   try {
  //     final response = await _apiService.getProfileData();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(error.toString());
  //   }
  // }
}

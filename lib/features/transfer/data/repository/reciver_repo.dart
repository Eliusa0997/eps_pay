import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_response.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_response.dart';

class ReciverRepo {
  final ApiService _apiService;
  ReciverRepo(this._apiService);

  Future<ApiResult<ReciverResponse>> getReciverData(
    ReciverRequestBody reciverRequestBody,
  ) async {
    try {
      final response = await _apiService.getReciverData(reciverRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

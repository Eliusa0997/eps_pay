import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_response.dart';

class TransferRepo {
  final ApiService _apiService;
  TransferRepo(this._apiService);
  Future<ApiResult<TransferRespone>> transfer(
    TransferRequestBody transferRequestBody,
  ) async {
    try {
      final response = await _apiService.transfer(transferRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

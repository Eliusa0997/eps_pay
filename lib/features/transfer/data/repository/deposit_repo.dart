import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_response.dart';

class DepositRepo {
  final ApiService _apiService;
  DepositRepo(this._apiService);
  Future<ApiResult<TransferRespone>> deposit(
    TransferRequestBody transferRequestBody,
  ) async {
    try {
      final response = await _apiService.deposit(transferRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

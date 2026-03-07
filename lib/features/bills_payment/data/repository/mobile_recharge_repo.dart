import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_response.dart';

class MobileRechargeRepo {
  final ApiService _apiService;
  MobileRechargeRepo(this._apiService);
  Future<ApiResult<BillsResponse>> mobileRecharge(
    BillsRequestBody billsRequestBody,
  ) async {
    try {
      final response = await _apiService.mobileRecharge(billsRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

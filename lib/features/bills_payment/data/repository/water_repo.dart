import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_response.dart';

class WaterRepo {
  final ApiService _apiService;
  WaterRepo(this._apiService);
  Future<ApiResult<BillsResponse>> water(BillsRequestBody billsRequestBody) async {
    try {
      final response = await _apiService.water(billsRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}   
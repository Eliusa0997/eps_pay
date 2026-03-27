import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/bills_payment/data/model/bill_payment_response.dart';

class BillPaymentRepo {
  final ApiService _apiService;
  BillPaymentRepo(this._apiService);

  Future<ApiResult<List<BillPaymentResponse>>> getBillsAndPayments() async {
    try {
      final response = await _apiService.getBillsAndPayments();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/home_dashboard/data/model/transactions_history_model.dart';

class TransactionsHistoryRepo {
  final ApiService _apiService;
  TransactionsHistoryRepo(this._apiService);
  Future<ApiResult<List<TransactionHistoryModel>>>
  getTransactionsHistory() async {
    try {
      final response = await _apiService.getTransactionsHistory();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}

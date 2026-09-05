import 'package:eps_pay/core/networking/api_error_handler.dart';
import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/features/home_dashboard/data/model/transaction_history_pagination_model.dart';

class TransactionsHistoryRepo {
  final ApiService _apiService;

  TransactionsHistoryRepo(this._apiService);

  Future<ApiResult<TransactionHistoryPaginationModel>> getTransactionsHistory(
    int page,
  ) async {
    try {
      final response = await _apiService.getTransactionsHistory(page);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}



// import 'package:eps_pay/core/networking/api_error_handler.dart';
// import 'package:eps_pay/core/networking/api_result.dart';
// import 'package:eps_pay/core/networking/api_service.dart';
// import 'package:eps_pay/features/home_dashboard/data/model/transactions_history_model.dart';

// class TransactionsHistoryRepo {
//   final ApiService _apiService;
//   TransactionsHistoryRepo(this._apiService);
//   Future<ApiResult<List<TransactionHistoryResponseModel>>>
//   getTransactionsHistory() async {
//     try {
//       final response = await _apiService.getTransactionsHistory();
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ApiErrorHandler.handle(error));
//     }
//   }
// }



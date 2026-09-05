import 'package:eps_pay/features/home_dashboard/data/model/transactions_history_response_model.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/transactions_history_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/transactions_history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';

class TransactionsHistoryCubit extends Cubit<TransactionsHistoryState> {
  final TransactionsHistoryRepo _transactionsHistoryRepo;

  TransactionsHistoryCubit(this._transactionsHistoryRepo)
    : super(TransactionsHistoryState.initial());

  List<TransactionHistoryResponseModel> allTransactions = [];

  int currentPage = 1;
  bool hasMore = true;
  bool isLoadingMore = false;

  // Load first page
  Future<void> emitTransactionsHistoryState() async {
    print("🔵 Loading transactions...");

    currentPage = 1;
    hasMore = true;
    allTransactions.clear();

    emit(TransactionsHistoryState.loading());

    final response = await _transactionsHistoryRepo.getTransactionsHistory(
      currentPage,
    );

    response.when(
      success: (transactionsHistoryResponse) {
        allTransactions = transactionsHistoryResponse.results;

        hasMore = transactionsHistoryResponse.next != null;

        print("✅ First page loaded: ${allTransactions.length}");
        print("➡️ Has more: $hasMore");

        emit(TransactionsHistoryState.success(allTransactions));
      },
      failure: (apiErrorModel) {
        print("❌ Error: $apiErrorModel");

        emit(TransactionsHistoryState.error(apiErrorModel));
      },
    );
  }

  // Load next page
  Future<void> loadMoreTransactions() async {
    if (isLoadingMore || !hasMore) {
      return;
    }

    isLoadingMore = true;

    final nextPage = currentPage + 1;

    print("🔵 Loading page $nextPage...");

    final response = await _transactionsHistoryRepo.getTransactionsHistory(
      nextPage,
    );

    response.when(
      success: (transactionsHistoryResponse) {
        allTransactions.addAll(transactionsHistoryResponse.results);

        currentPage = nextPage;

        hasMore = transactionsHistoryResponse.next != null;

        print(
          "✅ Page $currentPage loaded. "
          "Total: ${allTransactions.length}",
        );

        print("➡️ Has more: $hasMore");

        emit(TransactionsHistoryState.success(List.from(allTransactions)));
      },
      failure: (apiErrorModel) {
        print("❌ Load more error: $apiErrorModel");

        // We don't replace the existing list if loading another page fails.
        emit(TransactionsHistoryState.success(List.from(allTransactions)));
      },
    );

    isLoadingMore = false;
  }
}

// import 'package:eps_pay/features/home_dashboard/data/model/transactions_history_model.dart';
// import 'package:eps_pay/features/home_dashboard/data/repository/transactions_history_repo.dart';
// import 'package:eps_pay/features/home_dashboard/logic/cubit/transactions_history_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/networking/api_result.dart';

// class TransactionsHistoryCubit extends Cubit<TransactionsHistoryState> {
//   final TransactionsHistoryRepo _transactionsHistoryRepo;

//   TransactionsHistoryCubit(this._transactionsHistoryRepo)
//     : super(TransactionsHistoryState.initial());
//   List<TransactionHistoryModel> allTransactions = [];

//   void emitTransactionsHistoryState() async {
//     print("🔵 Loading transactions...");
//     emit(TransactionsHistoryState.loading());
//     final response = await _transactionsHistoryRepo.getTransactionsHistory();
//     response.when(
//       success: (transactionsHistoryResponse) {
//         print("✅ Success: ${transactionsHistoryResponse.length}");
//         allTransactions = transactionsHistoryResponse;
//         print("✅ Success my list: ${allTransactions.length}");
//         emit(TransactionsHistoryState.success(transactionsHistoryResponse));
//       },
//       failure: (apiErrorModel) {
//         print("❌ Error: $apiErrorModel");
//         emit(TransactionsHistoryState.error(apiErrorModel));
//       },
//     );
//   }
// }

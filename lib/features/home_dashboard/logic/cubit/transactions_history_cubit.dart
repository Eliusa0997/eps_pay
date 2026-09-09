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
    print("🟠 Calling API for page 1...");
    final response = await _transactionsHistoryRepo.getTransactionsHistory(
      currentPage,
    );
    print("🟠 API response received for page 1");
    response.when(
      success: (transactionsHistoryResponse) {
        allTransactions = transactionsHistoryResponse.results;

        hasMore = transactionsHistoryResponse.next != null;

        print("✅ First page loaded: ${allTransactions.length}");
        print("➡️ Has more: $hasMore");

        emit(
          TransactionsHistoryState.success(
            List<TransactionHistoryResponseModel>.from(allTransactions),
          ),
        );
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

        print('🚨 EMITTING ${allTransactions.length} TRANSACTIONS');
        emit(TransactionsHistoryState.success(List.from(allTransactions)));
        print("🚨 SUCCESS 40 EMITTED");
        print("🚨 CUBIT CLOSED: $isClosed");
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

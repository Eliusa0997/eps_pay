import 'package:eps_pay/features/home_dashboard/data/model/transactions_history_model.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/transactions_history_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/transactions_history_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';

class TransactionsHistoryCubit extends Cubit<TransactionsHistoryState> {
  final TransactionsHistoryRepo _transactionsHistoryRepo;

  TransactionsHistoryCubit(this._transactionsHistoryRepo)
    : super(TransactionsHistoryState.initial());
  List<TransactionHistoryModel> allTransactions = [];

  void emitTransactionsHistoryState() async {
    print("🔵 Loading transactions...");
    emit(TransactionsHistoryState.loading());
    final response = await _transactionsHistoryRepo.getTransactionsHistory();
    response.when(
      success: (transactionsHistoryResponse) {
        print("✅ Success: ${transactionsHistoryResponse.length}");
        allTransactions = transactionsHistoryResponse;
        emit(TransactionsHistoryState.success(transactionsHistoryResponse));
      },
      failure: (failure) {
        print("❌ Error: $failure");
        emit(TransactionsHistoryState.error(message: failure.toString()));
      },
    );
  }
}

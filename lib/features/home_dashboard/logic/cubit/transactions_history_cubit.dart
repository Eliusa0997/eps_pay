import 'package:eps_pay/features/home_dashboard/data/repository/transactions_history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/transactions_history_state.dart';   

class TransactionsHistoryCubit extends Cubit<TransactionsHistoryState> {
  final TransactionsHistoryRepo _transactionsHistoryRepo; 

  TransactionsHistoryCubit(this._transactionsHistoryRepo);
  void emitTransactionsHistoryState() async {
    emit(TransactionsHistoryState.loading());
    final response = await _transactionsHistoryRepo.getTransactionsHistory();
    response.when(
      success: (transactionsHistoryResponse) {
        emit(TransactionsHistoryState.success(transactionsHistoryResponse));
      },
      failure: (failure) {
        emit(TransactionsHistoryState.error(message: failure.toString()));
      },
    );
  } 
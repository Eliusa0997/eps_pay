import 'package:eps_pay/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'transactions_history_state.freezed.dart';

@freezed
class TransactionsHistoryState<T> with _$TransactionsHistoryState {
  const factory TransactionsHistoryState.initial() = _Initial;
  const factory TransactionsHistoryState.loading() = Loading;
  const factory TransactionsHistoryState.success(T data) = Success<T>;
  const factory TransactionsHistoryState.error(ApiErrorModel apiErrorModel) =
      Error;
}

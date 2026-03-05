import 'package:freezed_annotation/freezed_annotation.dart';
part 'transactions_history_state.freezed.dart';

@freezed
class TransactionsHistoryState with _$TransactionsHistoryState {
  const factory TransactionsHistoryState.initial() = _Initial;
  const factory TransactionsHistoryState.loading() = Loading;
  const factory TransactionsHistoryState.success(T data) = Success<T>;
  const factory TransactionsHistoryState.error(String message) = Error;
}
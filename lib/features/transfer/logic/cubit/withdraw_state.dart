import 'package:freezed_annotation/freezed_annotation.dart';
part 'withdraw_state.freezed.dart';

@freezed
class WithdrawState<T> with _$WithdrawState {
  const factory WithdrawState.initial() = _Initial;
  const factory WithdrawState.loading() = Loading;
  const factory WithdrawState.success(T data) = Success<T>;
  const factory WithdrawState.error({required String message}) = Error;
}

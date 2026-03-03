import 'package:freezed_annotation/freezed_annotation.dart';
part 'deposit_state.freezed.dart';

@freezed
class DepositState<T> with _$DepositState {
  const factory DepositState.initial() = _Initial;
  const factory DepositState.loading() = Loading;
  const factory DepositState.success(T data) = Success<T>;
  const factory DepositState.error({required String message}) = Error;
}

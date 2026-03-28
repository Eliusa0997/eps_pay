import 'package:freezed_annotation/freezed_annotation.dart';
part 'bills_and_payment_state.freezed.dart';

@freezed
class BillsAndPaymentState<T> with _$BillsAndPaymentState {
  const factory BillsAndPaymentState.initial() = _Initial;
  const factory BillsAndPaymentState.loading() = Loading;
  const factory BillsAndPaymentState.success(T data) = Success<T>;
  const factory BillsAndPaymentState.error({required String message}) = Error;
}

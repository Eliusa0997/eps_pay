import 'package:freezed_annotation/freezed_annotation.dart';
part 'mobile_recharge_state.freezed.dart';

@freezed
class MobileRechargeState<T> with _$MobileRechargeState {
  const factory MobileRechargeState.initial() = _Initial;
  const factory MobileRechargeState.loading() = Loading;
  const factory MobileRechargeState.success(T data) = Success<T>;
  const factory MobileRechargeState.error({required String message}) = Error;
}           
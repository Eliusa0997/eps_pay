import 'package:freezed_annotation/freezed_annotation.dart';
part 'electricity_state.freezed.dart';

@freezed
class ElectricityState<T> with _$ElectricityState {
  const factory ElectricityState.initial() = _Initial;
  const factory ElectricityState.loading() = Loading;
  const factory ElectricityState.success(T data) = Success<T>;
  const factory ElectricityState.error({required String message}) = Error;
}

import 'package:eps_pay/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'water_state.freezed.dart';

@freezed
class WaterState<T> with _$WaterState {
  const factory WaterState.initial() = _Initial;
  const factory WaterState.loading() = Loading;
  const factory WaterState.success(T data) = Success<T>;
  const factory WaterState.error(ApiErrorModel apiErrorModel) = Error;
}

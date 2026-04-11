import 'package:eps_pay/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reciver_state.freezed.dart';

@freezed
class ReciverState<T> with _$ReciverState {
  const factory ReciverState.initial() = _Initial;
  const factory ReciverState.loading() = Loading;
  const factory ReciverState.success(T data) = Success<T>;
  const factory ReciverState.error(ApiErrorModel apiErrorModel) = Error;
}

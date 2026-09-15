import 'package:eps_pay/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'transfer_state.freezed.dart';

@freezed
class TransferState<T> with _$TransferState {
  const factory TransferState.initial() = _Initial;
  const factory TransferState.loading() = Loading;
  const factory TransferState.success(T data) = Success<T>;
  const factory TransferState.error(ApiErrorModel apiErrorModel) = Error;
}

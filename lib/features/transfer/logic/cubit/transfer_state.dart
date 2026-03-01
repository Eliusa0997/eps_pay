import 'package:freezed_annotation/freezed_annotation.dart';
part 'transfer_state.freezed.dart';

@freezed
class TransferState<T> with _$TransferState {
  const factory TransferState.initial() = _Initial;
  const factory TransferState.loading() = Loading;
  const factory TransferState.success(T data) = Success<T>;
  const factory TransferState.error({required String message}) = Error;
}

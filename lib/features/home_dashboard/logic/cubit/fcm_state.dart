import 'package:freezed_annotation/freezed_annotation.dart';
part 'fcm_state.freezed.dart';

@freezed
class FcmState<T> with _$FcmState {
  const factory FcmState.initial() = _Initial;
  const factory FcmState.loading() = Loading;
  const factory FcmState.success(T data) = Success<T>;
  const factory FcmState.error({required String message}) = Error;
}

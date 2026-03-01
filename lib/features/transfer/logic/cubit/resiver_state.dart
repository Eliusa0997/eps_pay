import 'package:freezed_annotation/freezed_annotation.dart';
part 'reciver_state.freezed.dart';

@freezed
class ReciverState<T> with _$ReciverState {
  const factory ReciverState.initial() = _Initial;
  const factory ReciverState.loading() = Loading;
  const factory ReciverState.success(T data) = Success<T>;
  const factory ReciverState.error({required String message}) = Error;
}

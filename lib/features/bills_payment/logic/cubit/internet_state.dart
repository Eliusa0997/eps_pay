import 'package:freezed_annotation/freezed_annotation.dart';
part 'internet_state.freezed.dart';

@freezed
class InternetState<T> with _$InternetState {
  const factory InternetState.initial() = _Initial;
  const factory InternetState.loading() = Loading;
  const factory InternetState.success(T data) = Success<T>;
  const factory InternetState.error({required String message}) = Error;
}       
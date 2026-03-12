import 'package:freezed_annotation/freezed_annotation.dart';
part 'settings_state.freezed.dart';

@freezed
class SettingsState<T> with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.loading() = Loading;
  const factory SettingsState.success(T data) = Success<T>;
  const factory SettingsState.error({required String message}) = Error;
}

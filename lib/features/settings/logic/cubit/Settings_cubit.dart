import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/settings/data/model/settings_profile_model.dart';
import 'package:eps_pay/features/settings/data/repository/settings_repo.dart';
import 'package:eps_pay/features/settings/logic/cubit/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo __settingsRepo;

  SettingsCubit(this.__settingsRepo) : super(SettingsState.initial());
  late SettingsProfileModel settingsProfileModel;
  void emitSettingsState() async {
    emit(SettingsState.loading());
    print("object");
    final response = await __settingsRepo.getSettingsProfileData();
    response.when(
      success: (profileResponse) {
        settingsProfileModel = profileResponse;
        print("=========================================");
        print(settingsProfileModel.fullName);
        print("=========================================");
        emit(SettingsState.success(profileResponse));
      },
      failure: (apiErrorModel) {
        emit(SettingsState.error(apiErrorModel));
      },
    );
  }
}

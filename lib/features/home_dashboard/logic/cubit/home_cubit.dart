import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/home_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  ProfileModel? userdata;
  String? userName;
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  void emitHomeState() async {
    emit(HomeState.loading());
    final response = await _homeRepo.getProileData();
    response.when(
      success: (homeResponse) {
        print("================= from sucess============");
        emit(HomeState.success(homeResponse));
        userName = homeResponse.userName;
        print(homeResponse.accountNumber);
        print("================= after sucess============");
      },
      failure: (failure) {
        emit(HomeState.error(message: failure.toString()));
      },
    );
  }
}

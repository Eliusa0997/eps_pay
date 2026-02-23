import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/core/networking/dio_factory.dart';
import 'package:eps_pay/features/auth/login/data/repository/login_repo.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/features/auth/siginup/data/repository/signup_repo.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Create a global instance (or use GetIt.instance)
final getIt = GetIt.instance;

setupGetIt() {
  // Dio & ApiServices
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // ========= Auth ===========
  //  login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  //  signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit(getIt()));
}

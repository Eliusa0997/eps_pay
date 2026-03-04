import 'package:eps_pay/core/networking/api_service.dart';
import 'package:eps_pay/core/networking/dio_factory.dart';
import 'package:eps_pay/features/auth/login/data/repository/login_repo.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:eps_pay/features/auth/siginup/data/repository/signup_repo.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_cubit.dart';
import 'package:eps_pay/features/bills_payment/data/repository/electricity_repo.dart';
import 'package:eps_pay/features/bills_payment/data/repository/internet_repo.dart';
import 'package:eps_pay/features/bills_payment/data/repository/mobile_recharge_repo.dart';
import 'package:eps_pay/features/bills_payment/data/repository/water_repo.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/electricity_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/internet_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/mobile_recharge_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/water_cubit.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/home_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_cubit.dart';
import 'package:eps_pay/features/transfer/data/repository/deposit_repo.dart';
import 'package:eps_pay/features/transfer/data/repository/reciver_repo.dart';
import 'package:eps_pay/features/transfer/data/repository/transfer_repo.dart';
import 'package:eps_pay/features/transfer/data/repository/withdraw_repo.dart';
import 'package:eps_pay/features/transfer/logic/cubit/deposit_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/resiver_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_cubit.dart';
import 'package:eps_pay/features/transfer/logic/cubit/withdraw_cubit.dart';
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

  //  home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

  //  Transfer Money
  getIt.registerLazySingleton<TransferRepo>(() => TransferRepo(getIt()));
  getIt.registerLazySingleton<TransferCubit>(() => TransferCubit(getIt()));
  //  Deposit & Withdraw
  getIt.registerLazySingleton<DepositRepo>(() => DepositRepo(getIt()));
  getIt.registerLazySingleton<DepositCubit>(() => DepositCubit(getIt()));
  getIt.registerLazySingleton<WithdrawRepo>(() => WithdrawRepo(getIt()));
  getIt.registerLazySingleton<WithdrawCubit>(() => WithdrawCubit(getIt()));

  // Bills & Payment
  getIt.registerLazySingleton<ElectricityCubit>(
    () => ElectricityCubit(getIt()),
  );
  getIt.registerLazySingleton<ElectricityRepo>(() => ElectricityRepo(getIt()));
  getIt.registerLazySingleton<WaterCubit>(() => WaterCubit(getIt()));
  getIt.registerLazySingleton<WaterRepo>(() => WaterRepo(getIt()));
  getIt.registerLazySingleton<InternetCubit>(() => InternetCubit(getIt()));
  getIt.registerLazySingleton<InternetRepo>(() => InternetRepo(getIt()));
  getIt.registerLazySingleton<MobileRechargeCubit>(
    () => MobileRechargeCubit(getIt()),
  );
  getIt.registerLazySingleton<MobileRechargeRepo>(
    () => MobileRechargeRepo(getIt()),
  );

  //  Reciver Data
  getIt.registerLazySingleton<ReciverRepo>(() => ReciverRepo(getIt()));
  getIt.registerLazySingleton<ReciverCubit>(() => ReciverCubit(getIt()));
}

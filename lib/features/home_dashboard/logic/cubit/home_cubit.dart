// import 'package:eps_pay/core/networking/api_result.dart';
// import 'package:eps_pay/features/auth/login/data/model/fcm_request_body.dart';
// import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
// import 'package:eps_pay/features/home_dashboard/data/repository/home_repo.dart';
// import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo _homeRepo;
//   ProfileModel? userdata;
//   String? userName;
//   String? fullName;
//   String? totalBalance;
//   int? accountNumber;
//   List<RecentTransactions>? transactions;
//   HomeCubit(this._homeRepo) : super(HomeState.initial());

//   void setupHome() {
//     setupFcm();
//     emitHomeState();
//   }

//   void emitHomeState() async {
//     emit(HomeState.loading());
//     final response = await _homeRepo.getProileData();
//     response.when(
//       success: (homeResponse) {
//         emit(HomeState.success(homeResponse));
//         // userdata = homeResponse;
//         userName = homeResponse.userName;
//         fullName = homeResponse.fullName;
//         totalBalance = homeResponse.balance;
//         accountNumber = homeResponse.accountNumber;
//         transactions = homeResponse.recentTransactions;
//       },
//       failure: (apiErrorModel) {
//         emit(HomeState.error(apiErrorModel));
//       },
//     );
//   }

//   //  Get FCM Token
//   Future<String?> getFcmToken() async {
//     return await FirebaseMessaging.instance.getToken();
//   }

//   //  Sent The FCM Token
//   void setupFcm() async {
//     String? fcmToken = await getFcmToken();
//     if (fcmToken != null) {
//       await _homeRepo.sendFcmTokenToServer(FcmRequestBody(fcmToken: fcmToken));
//       print("FCM LOGIN TOKEN SENT SUCCESSFULY: $fcmToken");
//     }
//   }
// }

import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/auth/login/data/model/fcm_request_body.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/home_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  ProfileModel? userdata;
  String? userName;
  String? fullName;
  String? totalBalance;
  int? accountNumber;
  List<RecentTransactions>? transactions;

  HomeCubit(this._homeRepo) : super(HomeState.initial());

  void setupHome() {
    setupFcm();
    listenForMoneyReceived();
    emitHomeState();
  }

  Future<void> emitHomeState() async {
    emit(HomeState.loading());

    final response = await _homeRepo.getProileData();

    response.when(
      success: (homeResponse) {
        emit(HomeState.success(homeResponse));

        userName = homeResponse.userName;
        fullName = homeResponse.fullName;
        totalBalance = homeResponse.balance;
        accountNumber = homeResponse.accountNumber;
        transactions = homeResponse.recentTransactions;
      },
      failure: (apiErrorModel) {
        emit(HomeState.error(apiErrorModel));
      },
    );
  }

  Future<void> refreshHomeData() async {
    final response = await _homeRepo.getProileData();

    response.when(
      success: (homeResponse) {
        userdata = homeResponse;
        userName = homeResponse.userName;
        fullName = homeResponse.fullName;
        totalBalance = homeResponse.balance;
        accountNumber = homeResponse.accountNumber;
        transactions = homeResponse.recentTransactions;

        // No Loading state here
        emit(HomeState.success(homeResponse));
      },
      failure: (apiErrorModel) {
        print("Failed to refresh home data: $apiErrorModel");
      },
    );
  }

  void listenForMoneyReceived() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Money received - refreshing balance");

      refreshHomeData();
    });
  }

  Future<String?> getFcmToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  void setupFcm() async {
    String? fcmToken = await getFcmToken();

    if (fcmToken != null) {
      await _homeRepo.sendFcmTokenToServer(FcmRequestBody(fcmToken: fcmToken));

      print("FCM LOGIN TOKEN SENT SUCCESSFULY: $fcmToken");
    }
  }
}

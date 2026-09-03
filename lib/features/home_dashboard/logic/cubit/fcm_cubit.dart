import 'package:eps_pay/features/auth/login/data/model/fcm_request_body.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/fcm_repo.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/home_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/fcm_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmCubit extends Cubit<FcmState> {
  final FcmRepo _fcmRepo;
  FcmCubit(this._fcmRepo) : super(FcmState.initial());

  //  Get FCM Token
  Future<String?> getFcmToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  //  Sent The FCM Token
  void setupFcm() async {
    String? fcmToken = await getFcmToken();
    if (fcmToken != null) {
      await _fcmRepo.sendFcmTokenToServer(FcmRequestBody(fcmToken: fcmToken));
      print("FCM LOGIN TOKEN SENT SUCCESSFULY: $fcmToken");
    }
  }
}

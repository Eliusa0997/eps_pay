import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/data/repository/mobile_recharge_repo.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/mobile_recharge_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileRechargeCubit extends Cubit<MobileRechargeState> {
  final MobileRechargeRepo _mobileRechargeRepo;
  MobileRechargeCubit(this._mobileRechargeRepo)
    : super(const MobileRechargeState.initial());

  final amountController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitMobileRechargeState(BillsRequestBody billsRequestBody) async {
    emit(MobileRechargeState.loading());
    final response = await _mobileRechargeRepo.mobileRecharge(billsRequestBody);
    response.when(
      success: (mobileRechargeResponse) {
        emit(MobileRechargeState.success(mobileRechargeResponse));
      },
      failure: (failure) {
        emit(MobileRechargeState.error(message: failure.toString()));
      },
    );
  }
}

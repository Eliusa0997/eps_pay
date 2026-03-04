import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/data/repository/electricity_repo.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/electricity_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectricityCubit extends Cubit<ElectricityState> {
  final ElectricityRepo _electricityRepo;
  ElectricityCubit(this._electricityRepo)
    : super(const ElectricityState.initial());
  //  Global Key
  final amountController = TextEditingController();
  final counterNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitElectricityState(BillsRequestBody billsRequestBody) async {
    emit(ElectricityState.loading());
    final response = await _electricityRepo.electricity(billsRequestBody);
    response.when(
      success: (electricityResponse) {
        emit(ElectricityState.success(electricityResponse));
      },
      failure: (failure) {
        emit(ElectricityState.error(message: failure.toString()));
      },
    );
  }
}

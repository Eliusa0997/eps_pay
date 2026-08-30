import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/data/repository/water_repo.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/water_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaterCubit extends Cubit<WaterState> {
  final WaterRepo _waterRepo;
  WaterCubit(this._waterRepo) : super(const WaterState.initial());

  final amountController = TextEditingController();
  final invoiceNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void validateThenDoWaterPayment() {
    if (formKey.currentState!.validate()) {
      emitWaterPaymentState();
    }
  }

  void emitWaterPaymentState() async {
    emit(WaterState.loading());
    final response = await _waterRepo.water(
      BillsRequestBody(amount: amountController.text),
    );
    response.when(
      success: (waterResponse) {
        emit(WaterState.success(waterResponse));
      },
      failure: (apiErrorModel) {
        emit(WaterState.error(apiErrorModel));
      },
    );
  }
}

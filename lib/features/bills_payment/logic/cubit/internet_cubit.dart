import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/data/repository/internet_repo.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  final InternetRepo _internetRepo;
  InternetCubit(this._internetRepo) : super(const InternetState.initial());

  final amountController = TextEditingController();
  final invoiceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitInternetState(BillsRequestBody billsRequestBody) async {
    emit(InternetState.loading());
    final response = await _internetRepo.internet(billsRequestBody);
    response.when(
      success: (internetResponse) {
        emit(InternetState.success(internetResponse));
      },
      failure: (failure) {
        emit(InternetState.error(message: failure.toString()));
      },
    );
  }
}

import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/repository/deposit_repo.dart';
import 'package:eps_pay/features/transfer/logic/cubit/deposit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositCubit extends Cubit<DepositState> {
  final DepositRepo _depositRepo;
  DepositCubit(this._depositRepo) : super(DepositState.initial());

  final amountController = TextEditingController();
  //  Global Key
  final formKey = GlobalKey<FormState>();

  void emitDepositState(TransferRequestBody transferRequestBody) async {
    emit(DepositState.loading());
    final response = await _depositRepo.deposit(transferRequestBody);
    response.when(
      success: (depositResponse) {
        emit(DepositState.success(depositResponse));
      },
      failure: (failure) {
        emit(DepositState.error(message: failure.toString()));
      },
    );
  }
}

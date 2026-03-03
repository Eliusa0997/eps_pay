import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/repository/withdraw_repo.dart';
import 'package:eps_pay/features/transfer/logic/cubit/withdraw_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  final WithdrawRepo _withdrawRepo;
  WithdrawCubit(this._withdrawRepo) : super(WithdrawState.initial());

  final amountController = TextEditingController();

  //  Global Key
  final formKey = GlobalKey<FormState>();

  void emitWithdrawState(TransferRequestBody transferRequestBody) async {
    emit(WithdrawState.loading());
    final response = await _withdrawRepo.withdraw(transferRequestBody);
    response.when(
      success: (withdrawResponse) {
        emit(WithdrawState.success(withdrawResponse));
      },
      failure: (failure) {
        emit(WithdrawState.error(message: failure.toString()));
      },
    );
  }
}

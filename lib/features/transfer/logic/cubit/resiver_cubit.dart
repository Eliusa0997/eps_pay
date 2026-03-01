import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/home_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/repository/reciver_repo.dart';
import 'package:eps_pay/features/transfer/data/repository/transfer_repo.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReciverCubit extends Cubit<TransferState> {
  final ReciverRepo _reciverRepo;
  ReciverCubit(this._reciverRepo) : super(TransferState.initial());
  final reciverAccountNumberController = TextEditingController();
  //  Global Key
  final formKey = GlobalKey<FormState>();

  void emitReciverGetDataState(ReciverRequestBody reciverRequestBody) async {
    emit(TransferState.loading());
    final response = await _reciverRepo.getReciverData(reciverRequestBody);
    response.when(
      success: (transferResponse) {
        emit(TransferState.success(transferResponse));
      },
      failure: (failure) {
        emit(TransferState.error(message: failure.toString()));
      },
    );
  }
}

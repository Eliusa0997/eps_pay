import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/home_dashboard/data/repository/home_repo.dart';
import 'package:eps_pay/features/home_dashboard/logic/cubit/home_state.dart';
import 'package:eps_pay/features/transfer/data/repository/transfer_repo.dart';
import 'package:eps_pay/features/transfer/logic/cubit/transfer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferCubit extends Cubit<TransferState> {
  final TransferRepo _transferRepo;
  TransferCubit(this._transferRepo) : super(TransferState.initial());

  final accountNumber = TextEditingController();
  final phoneNumber = TextEditingController();
  //  Global Key
  final formKey = GlobalKey<FormState>();

  // void emitTransferState() async {
  //   emit(TransferState.loading());
  //   final response = await _transferRepo.getProileData();
  //   response.when(
  //     success: (homeResponse) {
  //       emit(TransferState.success(homeResponse));
  //     },
  //     failure: (failure) {
  //       emit(TransferState.error(message: failure.toString()));
  //     },
  //   );
  // }
}

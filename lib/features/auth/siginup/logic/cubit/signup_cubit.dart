import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/auth/siginup/data/model/signup_request_body.dart';
import 'package:eps_pay/features/auth/siginup/data/repository/signup_repo.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _SignupRepo;
  SignupCubit(this._SignupRepo) : super(SignupState.initial());

  // Form Controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  //  Global Key
  final formKey = GlobalKey<FormState>();

  void emitSignupState(SignupRequestBody signupRequestBody) async {
    emit(SignupState.loading());
    final response = await _SignupRepo.signup(signupRequestBody);
    response.when(
      success: (signupResponse) {
        emit(SignupState.success(signupResponse));
      },
      failure: (failure) {
        emit(SignupState.error(message: failure.toString()));
      },
    );
  }
}

import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/auth/login/data/model/login_request_body.dart';
import 'package:eps_pay/features/auth/login/data/repository/login_repo.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  // Form Controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  //  Global Key
  final formKey = GlobalKey<FormState>();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (failure) {
        emit(LoginState.error(message: failure.toString()));
      },
    );
  }
}

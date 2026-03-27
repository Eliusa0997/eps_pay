import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/auth/login/data/model/login_request_body.dart';
import 'package:eps_pay/features/auth/login/data/repository/login_repo.dart';
import 'package:eps_pay/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginCubit extends Cubit<LoginState> {
  final storage = FlutterSecureStorage();
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  // Form Controllers

  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final FlutterSecureStorage _userNameStorage = FlutterSecureStorage();
  //  Global Key
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    if (formKey.currentState!.validate()) {
      emit(LoginState.loading());
      final response = await _loginRepo.login(
        LoginRequestBody(
          userName: userNameController.text,
          password: passwordController.text,
        ),
      );
      response.when(
        success: (loginResponse) {
          saveTokens(
            loginResponse.accessToken.toString(),
            loginResponse.refreshToken.toString(),
          );
          saveUserName(userNameController.text);

          emit(LoginState.success(loginResponse));
        },
        failure: (failure) {
          emit(LoginState.error(message: failure.toString()));
        },
      );
    }
  }

  void saveUserName(String storedUserName) async {
    await _userNameStorage.write(
      key: 'stored_user_name',
      value: storedUserName,
    );
  }

  void getSavedUserName() async {
    String? storedUserName = await _userNameStorage.read(
      key: 'stored_user_name',
    );
    storedUserName!.isNotEmpty
        ? userNameController.text = storedUserName
        : userNameController.text;
  }

  Future<void> saveTokens(String access, String refresh) async {
    await storage.write(key: 'access_token', value: access);
    await storage.write(key: 'refresh_token', value: refresh);
  }
}

import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/auth/siginup/data/model/signup_request_body.dart';
import 'package:eps_pay/features/auth/siginup/data/repository/signup_repo.dart';
import 'package:eps_pay/features/auth/siginup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  static final FlutterSecureStorage _userNameStorage = FlutterSecureStorage();

  SignupCubit(this._signupRepo) : super(SignupState.initial());

  // Form Controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  //  Global Key
  final formKey = GlobalKey<FormState>();

  void emitSignupState(String storedUserName) async {
    emit(SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        userName: userNameController.text,
        password: passwordController.text,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
      ),
    );
    response.when(
      success: (signupResponse) {
        saveUserName(storedUserName);
        emit(SignupState.success(signupResponse));
      },
      failure: (failure) {
        emit(SignupState.error(message: failure.toString()));
      },
    );
  }

  void saveUserName(String storedUserName) async {
    await _userNameStorage.write(
      key: 'stored_user_name',
      value: storedUserName,
    );
  }
}

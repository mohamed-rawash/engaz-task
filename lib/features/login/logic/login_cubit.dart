import 'package:bloc/bloc.dart';
import 'package:engas_task/features/login/data/models/login_request_body.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../data/repositories/login_repo_impl.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepoImpl loginRepoImpl;

  LoginCubit(this.loginRepoImpl) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey= GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(LoginLoadingState());
    final response = await loginRepoImpl.login(loginRequestBody);
    response.fold(
      (error) => emit(LoginErrorState(error.errorMessage)),
      (success) => emit(
        LoginSuccessState(success),
      ),
    );
  }
}

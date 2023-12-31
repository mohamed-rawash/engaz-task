
import 'package:engas_task/features/login/data/models/login_response.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  final LoginResponse loginResponse;

  const LoginSuccessState(this.loginResponse);
}
class LoginErrorState extends LoginState {
  final String errorMessage;

  const LoginErrorState(this.errorMessage);
}

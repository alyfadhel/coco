import 'package:first_project/core/model/login_model.dart';

abstract class LoginState {}

class InitialLoginState extends LoginState{}

class ChangeVisibility extends LoginState{}

class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
 final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}
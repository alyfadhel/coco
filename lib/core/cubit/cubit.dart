import 'package:bloc/bloc.dart';
import 'package:first_project/core/constatnce.dart';
import 'package:first_project/core/cubit/state.dart';
import 'package:first_project/core/dio/dio_helper.dart';
import 'package:first_project/core/model/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibility());
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void getDataUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value){
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }
}

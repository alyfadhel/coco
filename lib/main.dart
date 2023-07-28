import 'package:first_project/core/cubit/cubit.dart';
import 'package:first_project/core/cubit/state.dart';
import 'package:first_project/core/dio/dio_helper.dart';
import 'package:first_project/core/login_screen.dart';
import 'package:first_project/core/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(),)
      ],
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return const MaterialApp(
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}



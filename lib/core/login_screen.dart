import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/core/cubit/cubit.dart';
import 'package:first_project/core/cubit/state.dart';
import 'package:first_project/core/widgets/my_button.dart';
import 'package:first_project/core/widgets/my_form_field.dart';
import 'package:first_project/core/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status!) {
            showToast(
              text: state.loginModel.message,
              state: ToastState.success,
            );
          } else {
            showToast(
              text: state.loginModel.message,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineLarge!,
                      ),
                      Text(
                        'Login to browse hot offer',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: 'emailAddress',
                          prefix: Icons.email_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20.0,
                      ),
                      MyFormField(
                        controller: cubit.passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'password',
                        prefix: Icons.lock_outline,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        isPassword: cubit.isPassword,
                        suffix: cubit.suffix,
                        onPressed: () {
                          cubit.changeVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => MyButton(
                            onPressedTextButton: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getDataUser(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: 'Login'),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

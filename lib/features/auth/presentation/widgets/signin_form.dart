import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/bloc/authbloc.dart';
import 'package:dalel/features/auth/presentation/bloc/authevent.dart';
import 'package:dalel/features/auth/presentation/bloc/authstates.dart';
import 'package:dalel/features/auth/presentation/views/forget_password.dart';
import 'package:dalel/features/auth/presentation/views/signup.dart';
import 'package:dalel/features/auth/presentation/widgets/already_have_account.dart';
import 'package:dalel/features/auth/presentation/widgets/textfield.dart';
import 'package:dalel/features/home/presentation/view/view.dart';
import 'package:dalel/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthBloc(context.read<ProfileBloc>()),
      child: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Succes')));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
              return HomeScreen();
            }));
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else {
            return;
          }
        },
        builder: (context, state) {
          return Form(
              key: AuthBloc.loginformkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomTextFeild(
                      labelText: 'Email Address',
                      controller: AuthBloc.emailController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    CustomTextFeild(
                      labelText: 'Password',
                      controller: AuthBloc.passwordController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      icon: AuthBloc.isobscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onPressSuffix: () {
                        context
                            .read<AuthBloc>()
                            .add(UpdateOpscureEvent(!AuthBloc.isobscure));
                      },
                      obscureText: AuthBloc.isobscure,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) {
                            return const ForgetPasswordScreen();
                          }));
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .08,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: state is LoginLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.appColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Sign In'),
                              onPressed: () {
                                if (AuthBloc.loginformkey.currentState!
                                    .validate()) {
                                  context.read<AuthBloc>().add(LoginEvent(
                                      AuthBloc.emailController.text,
                                      AuthBloc.passwordController.text));
                                }
                              },
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AlreadyHaveAccount(
                        text1: 'Don’t have an account ? ',
                        text2: 'Sign Up',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) {
                            return const SignupScreen();
                          }));
                        }),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/bloc/authbloc.dart';
import 'package:dalel/features/auth/presentation/bloc/authevent.dart';
import 'package:dalel/features/auth/presentation/bloc/authstates.dart';
import 'package:dalel/features/auth/presentation/views/signin.dart';
import 'package:dalel/features/auth/presentation/widgets/textfield.dart';
import 'package:dalel/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthBloc(context.read<ProfileBloc>()),
      child: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is SuccessResetPassword) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Check Your Email To Reset Your Password')));
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return const SignInScreen();
            }));
          } else if (state is FailResetPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage.toString())));
          }
        },
        builder: (context, state) {
          return Form(
              key: AuthBloc.forgetPasswordformkey,
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
                      height: height * .2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: state is LoadingResetPassword
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
                              child: const Text('Send Rest Password Link'),
                              onPressed: () {
                                if (AuthBloc.forgetPasswordformkey.currentState!
                                    .validate()) {
                                  context
                                      .read<AuthBloc>()
                                      .add(SendResetPasswordLink(
                                        AuthBloc.emailController.text,
                                      ));
                                  AuthBloc.emailController.clear();
                                }
                              },
                            ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

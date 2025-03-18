import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/bloc/authbloc.dart';
import 'package:dalel/features/auth/presentation/bloc/authevent.dart';
import 'package:dalel/features/auth/presentation/bloc/authstates.dart';
import 'package:dalel/features/auth/presentation/widgets/agreement.dart';
import 'package:dalel/features/auth/presentation/widgets/textfield.dart';
import 'package:dalel/features/home/presentation/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Succes')));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) {
              return const HomeScreen();
            }));
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else {
            return;
          }
        },
        builder: (context, state) {
          return Form(
              key: AuthBloc.formkey,
              child: Column(
                children: [
                  CustomTextFeild(
                    labelText: 'First Name',
                    controller: AuthBloc.firstNameController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  CustomTextFeild(
                    labelText: 'Last Name',
                    controller: AuthBloc.lastNameController,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
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
                  Agreement(
                    text1: 'I have agree to our ',
                    text2: 'Terms and Condition',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: height * .08,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: state is SignupLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !AuthBloc.isCheck
                                  ? Colors.grey
                                  : AppColors.appColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Sign Up'),
                            onPressed: () {
                              if (AuthBloc.isCheck) {
                                if (AuthBloc.formkey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(SignupEvent(
                                      AuthBloc.emailController.text,
                                      AuthBloc.passwordController.text));
                                }
                              }
                            },
                          ),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                ],
              ));
        },
      ),
    );
  }
}

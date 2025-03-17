// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:dalel/features/auth/presentation/bloc/authevent.dart';
import 'package:dalel/features/auth/presentation/bloc/authstates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvents>((event, emit) {});

    on<LoginEvent>((event, emit) {
      signup(event.email, event.password);
    });

    on<UpdateCheckBoxEvent>((event, emit) {
      updateIsCheck(event.value);
    });

    on<UpdateOpscureEvent>((event, emit) {
      updateIsOpsecure(event.value);
    });
  }
  static final formkey = GlobalKey<FormState>();

  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  static bool isCheck = false;
  static bool isobscure = false;
  signup(String email, String password) async {
    try {
      emit(SignupLoading());
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignupSuccess(userCredential.user!));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  updateIsCheck(value) {
    isCheck = value;
    emit(UpdateCheckBoxState(isCheck));
  }

  updateIsOpsecure(value) {
    isobscure = value;
    emit(UpdateIsOpscureState(isobscure));
  }
}

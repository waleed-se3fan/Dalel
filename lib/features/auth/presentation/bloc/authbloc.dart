// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/auth/presentation/bloc/authevent.dart';
import 'package:dalel/features/auth/presentation/bloc/authstates.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvents>((event, emit) {});

    on<SignupEvent>((event, emit) {
      signup(event.email, event.password);
    });

    on<LoginEvent>((event, emit) {
      login(event.email, event.password);
    });

    on<UpdateCheckBoxEvent>((event, emit) {
      updateIsCheck(event.value);
    });

    on<UpdateOpscureEvent>((event, emit) {
      updateIsOpsecure(event.value);
    });
    on<SendResetPasswordLink>((event, emit) {
      sendResetPasswordLink(event.email);
    });
  }
  static final formkey = GlobalKey<FormState>();
  static final loginformkey = GlobalKey<FormState>();
  static final forgetPasswordformkey = GlobalKey<FormState>();

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
      storeUser(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text);
      emit(SignupSuccess(userCredential.user!));
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }

  login(String email, String password) async {
    try {
      emit(LoginLoading());
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(userCredential.user!));
    } catch (e) {
      emit(LoginFailure(e.toString()));
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

  storeUser(
      {required String firstName,
      required String lastName,
      required String email}) {
    emit(LoadingStoreUser());
    try {
      CollectionReference user = FirebaseFirestore.instance.collection('user');
      user.add({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      });
      emit(SuccesStoreUser());
    } catch (e) {
      emit(FailStoreUser());
    }
  }

  sendResetPasswordLink(String email) async {
    emit(LoadingResetPassword());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(SuccessResetPassword());
    } catch (e) {
      emit(FailResetPassword(e.toString()));
    }
  }
}

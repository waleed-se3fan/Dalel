import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class SignupLoading extends AuthStates {}

class SignupSuccess extends AuthStates {
  final User user;
  SignupSuccess(this.user);
}

class SignupFailure extends AuthStates {
  final String error;
  SignupFailure(this.error);
}

class UpdateCheckBoxState extends AuthStates {
  bool value;
  UpdateCheckBoxState(this.value);
}

class UpdateIsOpscureState extends AuthStates {
  bool value;
  UpdateIsOpscureState(this.value);
}

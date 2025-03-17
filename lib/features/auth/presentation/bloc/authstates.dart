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

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  final User user;
  LoginSuccess(this.user);
}

class LoginFailure extends AuthStates {
  final String error;
  LoginFailure(this.error);
}

class LoadingStoreUser extends AuthStates {}

class SuccesStoreUser extends AuthStates {}

class FailStoreUser extends AuthStates {}

class LoadingResetPassword extends AuthStates {}

class SuccessResetPassword extends AuthStates {}

class FailResetPassword extends AuthStates {
  final String errorMessage;
  FailResetPassword(this.errorMessage);
}

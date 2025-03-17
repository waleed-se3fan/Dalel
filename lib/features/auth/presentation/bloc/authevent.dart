abstract class AuthEvents {}

class SignupEvent extends AuthEvents {
  SignupEvent(this.email, this.password);
  final String email;
  final String password;
}

class LoginEvent extends AuthEvents {
  LoginEvent(this.email, this.password);
  final String email;
  final String password;
}

class UpdateCheckBoxEvent extends AuthEvents {
  bool value;
  UpdateCheckBoxEvent(this.value);
}

class UpdateOpscureEvent extends AuthEvents {
  bool value;
  UpdateOpscureEvent(this.value);
}

part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String firstnameController;
  final String lastnameController;
  final String password;
  final String phoneController;
  UpdateProfileEvent(this.firstnameController, this.lastnameController,
      this.password, this.phoneController);
}

class GetImageEvent extends ProfileEvent {}

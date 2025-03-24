part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class LoadingGetProfile extends ProfileState {}

class SuccessGetProfile extends ProfileState {
  final UserModel model;
  final String location;
  final String image;
  SuccessGetProfile(this.model, this.location, this.image);
}

class FailGetProfile extends ProfileState {}

class SuccesGetImageState extends ProfileState {
  final String image;
  SuccesGetImageState(this.image);
}

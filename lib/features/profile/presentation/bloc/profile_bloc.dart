import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
  }

  getUserData() async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    String? name = FirebaseAuth.instance.currentUser!.photoURL;

    print(email);
    print(name);
  }
}

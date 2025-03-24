import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/profile/data/user_model.dart';
import 'package:dalel/features/profile/presentation/views/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:geocoding/geocoding.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<GetProfileEvent>((event, emit) {
      getUserData();
    });

    on<UpdateProfileEvent>((event, emit) {
      updateProfileData(event.firstnameController, event.lastnameController,
          event.password, event.phoneController);
    });
    on<GetImageEvent>((event, emit) {
      getProfileImage();
    });
  }

  UserModel? user;

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  User? userData;
  String? image;
  String? location;
  List<UserModel>? info;
  getUserData() async {
    emit(LoadingGetProfile());
    try {
      userData = await FirebaseAuth.instance.currentUser!;
      final data = await FirebaseFirestore.instance
          .collection('user')
          .where('email', isEqualTo: userData!.email)
          .get();

      info = data.docs.map((e) => UserModel.fromFirestore(e.data())).toList();
      user = info![0];
      print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      print(user!.email);
      emit(SuccessGetProfile(info![0], location ?? '', image ?? ''));
    } catch (e) {
      print(e.toString());
      print('---------------------------------------------------------');
    }
  }

  getProfileImage() async {
    try {
      XFile? file = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      image = file!.path;
      print(image);
      emit(SuccessGetProfile(info![0], location ?? '', image!));
    } catch (e) {}
  }

  getProfileLocation() async {
    try {
      await Geolocator.requestPermission();
      Position cation = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(cation.latitude, cation.longitude);
      location = placemarks[0].street.toString();
      print(location.toString());
      print(placemarks[0].street.toString());
      emit(SuccessGetProfile(info![0], location!, image ?? ''));
    } catch (e) {
      print(e.toString());
    }
  }

  void updateProfileData(
      String fname, String lname, String password, String phone) async {
    userData = await FirebaseAuth.instance.currentUser!;

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('email', isEqualTo: userData!.email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        String docId = snapshot.docs.first.id;
        print('Document ID: $docId');
        try {
          print('..........................................');
          print(fname);
          print(lname);
          await FirebaseFirestore.instance
              .collection('user')
              .doc(docId)
              .update({
            'firstName': fname.isEmpty ? user!.firstName : fname,
            'lastName': fname.isEmpty ? user!.firstName : fname,
            'image': image!.isEmpty ? user!.image : image,
            'password': password,
            'phoneNumber': phone.isEmpty ? user!.phoneNumber : phone,
            'location': location!.isEmpty ? user!.location : location
          });

          print('+++++++++++++++++++++++++++++');
          add(GetProfileEvent());
        } catch (e) {
          print(e.toString());
          print('-----------------------');
        }
      } else {
        print('Document not found');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  /*editProfile() async {
    userData = await FirebaseAuth.instance.currentUser!;

    print(userData!.uid);

  }

*/
}

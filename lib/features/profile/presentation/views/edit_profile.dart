import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/widgets/custom_add_to_cart.dart';
import 'package:dalel/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        var bloc = context.read<ProfileBloc>();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                color: Color(0xFF6D4C41), // لون بني فاتح
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Color(0xFF6D4C41)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 👤 صورة البروفايل

                  GestureDetector(
                    onTap: () {
                      context.read<ProfileBloc>().add(GetImageEvent());
                    },
                    child: CircleAvatar(
                      backgroundImage: state is SuccessGetProfile
                          ? state.image.isEmpty
                              ? const CachedNetworkImageProvider(
                                      'https://www.shutterstock.com/image-vector/man-avatar-profile-picture-vector-260nw-2144793321.jpg')
                                  as ImageProvider<Object>?
                              : FileImage(File(state.image))
                          : FileImage(File(bloc.user!.image)),
                      radius: 50,
                      backgroundColor:
                          const Color(0xFFD7CCC8), // لون رمادي فاتح
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 📝 First Name & Last Name في صف واحد
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        label: bloc.user!.firstName,
                        controller: bloc.firstnameController,
                      )),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                          controller: bloc.lastnameController,
                          label: bloc.user!.lastName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                      controller: bloc.phoneController,
                      label: bloc.user!.phoneNumber.isEmpty
                          ? "Enter Your Phone number"
                          : bloc.user!.phoneNumber),

                  const SizedBox(height: 16),

                  CustomTextField(
                    label: 'Change your password',
                    controller: bloc.passwordController,
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                            isReadOnly: true,
                            label: state is SuccessGetProfile
                                ? state.location.isEmpty
                                    ? 'Enter your Location'
                                    : state.location
                                : bloc.user!.location),
                      ),
                      IconButton(
                        icon: const Icon(Icons.location_on,
                            color: Color(0xFF6D4C41)),
                        onPressed: () {
                          bloc.getProfileLocation();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  CustomAddtocartButton(
                    text: 'Save',
                    onPress: () {
                      // ProfileBloc().getUserData();
                      //ProfileBloc().getSpecificDocumentId();
                      context.read<ProfileBloc>().add(UpdateProfileEvent(
                          bloc.firstnameController.text,
                          bloc.lastnameController.text,
                          bloc.passwordController.text,
                          bloc.phoneController.text));

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: const Color(0xFFF5F5F5), // خلفية زي الصورة
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool? isReadOnly;
  const CustomTextField(
      {super.key, required this.label, this.controller, this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly ?? false,
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        labelStyle: const TextStyle(color: Color(0xFF6D4C41)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFFD7CCC8), // نفس لون الخلفية
          ),
        ),
      ),
    );
  }
}

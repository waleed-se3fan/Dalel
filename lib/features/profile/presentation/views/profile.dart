import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/widgets/custom_appbar.dart';
import 'package:dalel/features/auth/presentation/views/signin.dart';
import 'package:dalel/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dalel/features/profile/presentation/views/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ProfileBloc>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CustomAppBar(text: 'Profile'),
                Row(
                  children: [
                    state is SuccessGetProfile
                        ? CircleAvatar(
                            backgroundImage: FileImage(File(state.image)),
                            radius: 50,
                            backgroundColor:
                                const Color(0xFFD7CCC8), // لون رمادي فاتح
                          )
                        : const CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                'https://www.shutterstock.com/image-vector/man-avatar-profile-picture-vector-260nw-2144793321.jpg'),
                          ),
                    const SizedBox(width: 12),
                    state is SuccessGetProfile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${state.model.firstName} '
                                  '${state.model.lastName}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown)),
                              Text(state.model.email,
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          )
                        : const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('...........',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown)),
                              Text('...........................',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) {
                            return const EditProfileScreen();
                          }));
                        },
                        icon: const Icon(Icons.edit, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 8),
                Section(title: 'Account', items: [
                  ProfileItem(
                    icon: Icons.person,
                    text: 'Edit Profile',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return const EditProfileScreen();
                      }));
                    },
                  ),
                  const ProfileItem(
                      icon: Icons.notifications, text: 'Notification'),
                ]),
                const SizedBox(height: 16),
                Section(title: 'General', items: [
                  const ProfileItem(icon: Icons.lock, text: 'Security'),
                  const ProfileItem(
                      icon: Icons.privacy_tip, text: 'Privacy Policy'),
                  ProfileItem(
                    icon: Icons.logout,
                    text: 'Log Out',
                    onTap: () async {
                      await FirebaseAuth.instance.signOut().then((value) =>
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (c) {
                            return const SignInScreen();
                          }), (route) => false));
                    },
                  ),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<ProfileItem> items;

  const Section({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ...items,
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;

  const ProfileItem(
      {super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown),
      title: Text(text, style: const TextStyle(color: Colors.brown)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

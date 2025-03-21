import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/widgets/custom_appbar.dart';
import 'package:dalel/features/auth/presentation/views/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomAppBar(text: 'Profile'),
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.profile),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Youssef Ghunim',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown)),
                    Text('youssefghunim@gmail.com',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                Icon(Icons.edit, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),
            const Section(title: 'Account', items: [
              ProfileItem(icon: Icons.person, text: 'Edit Profile'),
              ProfileItem(icon: Icons.notifications, text: 'Notification'),
            ]),
            const SizedBox(height: 16),
            Section(title: 'General', items: [
              const ProfileItem(icon: Icons.settings, text: 'Settings'),
              const ProfileItem(icon: Icons.lock, text: 'Security'),
              const ProfileItem(
                  icon: Icons.privacy_tip, text: 'Privacy Policy'),
              ProfileItem(
                icon: Icons.logout,
                text: 'Log Out',
                onTap: () async {
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) {
                        return const SignInScreen();
                      })));
                },
              ),
            ]),
          ],
        ),
      ),
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

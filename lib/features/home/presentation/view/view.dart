import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/views/signin.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Text('Shopping Cart Page'),
    Text('Search Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           await FirebaseAuth.instance.signOut().then((value) =>
      //               Navigator.pushReplacement(context,
      //                   MaterialPageRoute(builder: (c) {
      //                 return const SignInScreen();
      //               })));
      //         },
      //         icon: const Icon(Icons.logout))
      //   ],
      // ),

      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.appColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.imagesHomeIcon),
            activeIcon: SvgPicture.asset(Assets.imagesHomeIconActive),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.imagesShoppingCart),
            activeIcon: SvgPicture.asset(Assets.imagesShoppingCartActive),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.imagesSearch),
            activeIcon: SvgPicture.asset(Assets.imagesSearchActive),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.imagesPerson),
            activeIcon: SvgPicture.asset(Assets.imagesPersonActive),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

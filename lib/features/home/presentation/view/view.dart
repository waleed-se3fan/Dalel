import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/views/signin.dart';
import 'package:dalel/features/bazar/presentation/view/bazar.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile.dart';
import 'package:dalel/features/search/presentation/view/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final GlobalKey<_HomeNavBarState> bottomNavBarKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: bottomNavBarKey);

  @override
  _HomeNavBarState createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeScreen> {
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const BazarScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
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

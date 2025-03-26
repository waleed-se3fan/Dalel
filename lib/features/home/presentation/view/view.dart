import 'package:dalel/core/utils/assets.dart';
import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/bazar/presentation/view/bazar.dart';
import 'package:dalel/features/home/presentation/view/appbar/books.dart';
import 'package:dalel/features/home/presentation/view/appbar/historical_char.dart';
import 'package:dalel/features/home/presentation/view/appbar/souveners.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dalel/features/profile/presentation/views/about.dart';
import 'package:dalel/features/profile/presentation/views/profile.dart';
import 'package:dalel/features/search/presentation/view/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

final GlobalKey<_HomeNavBarState> bottomNavBarKey = GlobalKey();
final GlobalKey<ScaffoldState> drawingkey = GlobalKey();

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
      key: drawingkey,
      drawer: const Drawer(
        child: DrawerView(),
      ),
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

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 100),
      const Text(
        'Welcome to Dalel',
        style: TextStyle(
          color: Colors.brown,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state is SuccessGetProfile
              ? Text(
                  '${state.model.firstName} ${state.model.lastName}',
                  style: const TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text('');
        },
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        'Explore Egyptian history',
        style: TextStyle(
          color: Colors.brown,
          fontSize: 14,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      buildDrawerItem(
        icon: Icons.history,
        text: 'Historical Eras',
        onTap: () {},
      ),
      buildDrawerItem(
        icon: Icons.account_balance,
        text: 'Historical Charaters',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return HistoricalCharDrawer();
          }));
        },
      ),
      buildDrawerItem(
        icon: Icons.museum,
        text: 'Souvenirs',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return SouvenirsDrawer();
          }));
        },
      ),
      buildDrawerItem(
        icon: Icons.book,
        text: 'Books',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return BooksDrawer();
          }));
        },
      ),
      const Divider(),
      buildDrawerItem(
        icon: Icons.settings,
        text: 'Settings',
        onTap: () {},
      ),
      buildDrawerItem(
        icon: Icons.info,
        text: 'About',
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return AboutScreen();
          }));
          //    Navigator.pop(context);
        },
      ),
    ]);
  }
}

Widget buildDrawerItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: Colors.brown),
    title: Text(
      text,
      style: const TextStyle(
        color: Colors.brown,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    onTap: onTap,
  );
}

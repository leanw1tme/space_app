import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:space_app/screens/home/view/favorite_screen.dart';
import 'package:space_app/screens/home/view/home_screen.dart';
import 'package:space_app/screens/welcome/view/welcome_screen.dart';
import 'package:space_app/theme/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const WelcomeScreen()
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: ShapeDecoration(
              color: BackPanel,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero))),
          child: SalomonBottomBar(
            backgroundColor: Colors.transparent,
            unselectedItemColor: GreyPanel,
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: Colors.blueAccent,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
                selectedColor: Colors.orange,
              ),

              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                title: const Text("Likes"),
                selectedColor: Colors.pink,
              ),
            ],
          ),
        ),
        backgroundColor: BackPanel,
        body: screens[_currentIndex]);
  }
}

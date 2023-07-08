import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:space_app/screens/home/view/favorite_screen.dart';
import 'package:space_app/screens/home/view/home_screen.dart';
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero))),
          child: SalomonBottomBar(
            backgroundColor: Colors.transparent,
            unselectedItemColor: GreyPanel,
            margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
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

              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite),
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

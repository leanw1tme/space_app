import 'package:space_app/screens/home/view/favorite_screen.dart';
import 'package:space_app/screens/home/view/home_screen.dart';
import 'package:space_app/screens/home/view/main_screen.dart';
import 'package:space_app/screens/home/view/model_screen.dart';
import 'package:space_app/screens/welcome/view/welcome_screen.dart';

final routes = {
  '/': (context) => const WelcomeScreen(),
  '/home': (context) => const MainScreen(),
  '/favorite': (context) => const FavoriteScreen(),
};

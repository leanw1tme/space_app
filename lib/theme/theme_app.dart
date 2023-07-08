import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screens/home/classes/favorites/favorite_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../router/router.dart';
import 'l10n/app_localization.dart';

class SpaceApp extends StatefulWidget {
  const SpaceApp({super.key});

  @override
  State<SpaceApp> createState() => _SpaceAppState();

  static _SpaceAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_SpaceAppState>();
}

class _SpaceAppState extends State<SpaceApp> {
  Locale _locale = Locale('en');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) => MaterialApp(
          locale: _locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                    color: Colors.white,
                    fontSize: 45.sp,
                    fontWeight: FontWeight.w600,
                    height: BorderSide.strokeAlignCenter),
                bodySmall: TextStyle(
                  color: Colors.white70,
                  fontSize: 18.sp,
                ),
              )),
          routes: routes,
          supportedLocales: [
            Locale('en'),
            Locale('ru'),
          ],
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}

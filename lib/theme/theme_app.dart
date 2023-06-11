import 'package:flutter/material.dart';

import '../router/router.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.w600,
                height: BorderSide.strokeAlignCenter),
            bodySmall: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          )),
      routes: routes,
    );
  }
}

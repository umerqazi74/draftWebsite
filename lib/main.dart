import 'dart:convert';

import 'package:draft_website/core/consts.dart';
import 'package:draft_website/screens/drawer_screen/drawer_tabs/nav_screens/line_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'api/repository/formation_checker.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/responsive_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const MyApp(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: mainAppColor,
        ),
        fontFamily: "Poppins",
      ),
      // home: const LoginScreen(),
      // home: const ResponsivePage(),
      // home:  LineUpScreen(),
      home: const ResponsivePage(),
    );
  }
}



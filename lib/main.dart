import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/splash_screen.dart';
// import 'custom_drawer/home_drawer.dart';
// import 'package:kiganjani_afya_check/views/drawer/navigation_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Journey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:  const SplashScreen(),
    );
  }
}


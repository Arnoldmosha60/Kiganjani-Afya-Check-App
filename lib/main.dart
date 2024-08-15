import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/HomePage.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/TargetedWeight.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/age.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/bodysize.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/height.dart';
import 'package:kiganjani_afya_check/views/pages/selectProgram.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/sex.dart';
import 'package:kiganjani_afya_check/views/pages/startup.dart';
import 'package:kiganjani_afya_check/views/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kiganjani Afya Check ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
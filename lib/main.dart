import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/gender.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/HomePage.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/Startworkout.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/chartbar.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/progress2.dart';
import 'package:kiganjani_afya_check/views/pages/Profile/profile.dart';
import 'package:kiganjani_afya_check/views/pages/Profile/user_profile.dart';
import 'package:kiganjani_afya_check/views/pages/Settings/settings.dart';
import 'package:kiganjani_afya_check/views/pages/distance.dart';
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
      home: DistanceTracker(),
    );
  }
}


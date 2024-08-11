import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'auth/welcome_back.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const WelcomeBack()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A73E8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center the animation
            Lottie.asset(
              'assets/animations/Splash-Animation.json',
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Stay Fit, Stay Healthy',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Karibu kwenye Kiganjani Afya Check',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Safari yako ya maisha yenye afya huanza hapa\nFuata uzani wako, baki kuwa na shughuli, na fika malengo yako kwa urahisi. \nJiandae kubadilisha maisha yako!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

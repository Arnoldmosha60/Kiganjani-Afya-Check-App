import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:kiganjani_afya_check/views/auth/welcome_back.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/Nutrition.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/Progress.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/introduction.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/workout.dart';
import 'package:kiganjani_afya_check/views/pages/Profile/user_profile.dart';
import 'package:kiganjani_afya_check/views/pages/Settings/settings.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kiganjani Afya Check',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      drawer: AppDrawer(), // Custom Drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Karibu kwenye Safari yako ya Afya',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tuanzishe mabadiliko yako leo!',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the next page or functionality
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UtanguliziPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Utangulizi',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Additional Features - Cards Positioned Higher
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeatureCard(
                  icon: Icons.fitness_center,
                  title: ' Mazoezi ',
                  color: Colors.green,
                  onTap: () {
                    // Navigate to the Workouts page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MazoeziPage()),
                    );
                  },
                ),
                FeatureCard(
                  icon: Icons.food_bank,
                  title: 'Lishe Bora',
                  color: Colors.orange,
                  onTap: () {
                    // Navigate to the Nutrition page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LisheBoraPage()),
                    );
                  },
                ),
                FeatureCard(
                  icon: Icons.show_chart,
                  title: 'Maendeleo',
                  color: Colors.purple,
                  onTap: () {
                    // Navigate to the Progress page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MaendeleoPage()),
                    );
                  },
                ),
              ],
            ),
            const Spacer(), // Pushes the buttons to the bottom
            // Impressive Animated Buttons at the Bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BounceInUp(
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateToPage(context, SecondPage());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Huduma',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                BounceInUp(
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateToPage(context, StatsPage());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Endelea na Mpango',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  FeatureCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              // image: DecorationImage(
              //   image: AssetImage('assets/images/customer-service.png'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Dr Silas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Nyumbani'),
                  onTap: () {
                    // Navigate to Home
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Wasifu'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Mipangilio'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Huduma & Maoni'),
            onTap: () {
              // Navigate to Help & Feedback
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Toka'),
            onTap: () {
              // Handle Logout
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeBack()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('Welcome to the second page!'),
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stats Page'),
      ),
      body: const Center(
        child: Text('Welcome to the stats page!'),
      ),
    );
  }
}

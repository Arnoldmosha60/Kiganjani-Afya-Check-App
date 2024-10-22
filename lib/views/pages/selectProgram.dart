import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/age.dart';

import '../../backend/model/assessment.dart';


class Selectprogram extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uzito Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: SelectProgram(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class SelectProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Chagua Chaguo Lako',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use MediaQuery to adjust the vertical offset dynamically
            Expanded(
              child: ListView(
                children: [
                  OptionCard(
                    title: 'Punguza Uzito Kimuujiza',
                    description:
                        'Fikia malengo yako ya uzito kwa haraka na kwa ufanisi kupitia njia za kibunifu.',
                    icon: Icons.flash_on,
                    color: Colors.green.shade700,
                    onTap: () {
                      // Create an instance of AssessmentData
                      AssessmentData assessmentData = AssessmentData();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeScreen(data: assessmentData),
                        ),
                      );
                    },),

                  const SizedBox(height: 20),
                  OptionCard(
                    title: 'Tuzo la Mpunguza Uzito Bora Tanzania',
                    description:
                        'Shiriki na ushinde tuzo kama mpunguza uzito bora nchini Tanzania.',
                    icon: Icons.star,
                    color: Colors.orange.shade700,
                    onTap: () {
                      // Navigate to the second option page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TuzoPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  OptionCard({
    required this.title,
    required this.description,
    required this.icon,
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
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // Updated shadow color for better contrast
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10), // Add vertical margin for spacing
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Placeholder page for Tuzo la Mpunguza Uzito Bora Tanzania
class TuzoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tuzo la Mpunguza Uzito Bora Tanzania'),
      ),
      body: Center(
        child: Text('Welcome to Tuzo la Mpunguza Uzito Bora Tanzania!'),
      ),
    );
  }
}

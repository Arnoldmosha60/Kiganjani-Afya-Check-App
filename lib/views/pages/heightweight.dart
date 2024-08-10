// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/HomePage.dart';

class HeightWeightPage extends StatefulWidget {
  final String age;
  final String sex;

  HeightWeightPage({super.key, required this.age, required this.sex});

  @override
  _HeightWeightPageState createState() => _HeightWeightPageState();
}

class _HeightWeightPageState extends State<HeightWeightPage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Height and Weight'),
        backgroundColor: Colors.teal, // Change the AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Text color
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color for TextField
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color for TextField
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Process the data if needed
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Finish',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

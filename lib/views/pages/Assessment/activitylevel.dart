import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/TargetedWeight.dart';

import '../../../backend/model/assessment.dart';

class ActivityLevelScreen extends StatefulWidget {
  final AssessmentData data;

  const ActivityLevelScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _ActivityLevelScreenState createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  String? _activityLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Select Your Activity Level',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildActivityLevelOption(
                    context,
                    'Low',
                    'assets/images/customer-service.png',
                    'Mazoezi kidogo au hakuna kabisa.',
                  ),
                  _buildActivityLevelOption(
                    context,
                    'Moderate',
                    'assets/images/customer-service.png',
                    'Mazoezi ya kati/michezo siku 3-5 kwa wiki.',
                  ),
                  _buildActivityLevelOption(
                    context,
                    'High',
                    'assets/images/customer-service.png',
                    'Mazoezi makali/michezo siku 6-7 kwa wiki.',
                  ),
                ],
              ),
            ),
            Center(
              // Added Center widget to center the button
              child: ElevatedButton(
                onPressed: () {
                  if (_activityLevel != null) {
                    widget.data.activityLevel = _activityLevel!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TargetWeightScreen(data: widget.data),
                      ),
                    );
                  }
                },
                child: const Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityLevelOption(BuildContext context, String title,
      String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activityLevel = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                imagePath,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _activityLevel == title
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_activityLevel == title)
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.check, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}

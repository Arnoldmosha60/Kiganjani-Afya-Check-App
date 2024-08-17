import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kiganjani_afya_check/backend/model/assessment.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/HomePage.dart';

class BodySizeScreen extends StatelessWidget {
  final AssessmentData data;

  const BodySizeScreen({super.key, required this.data});

  Future<void> _submitData(BuildContext context, String bodyShape) async {
    data.bodyShape = bodyShape;

    // Replace with your API endpoint
    final url = Uri.parse('http://192.168.1.158:8080/assessment/save');

    // Create a map of the data
    final Map<String, dynamic> dataMap = {
      'age': data.age,
      'gender': data.gender,
      'height': data.height,
      'weight': data.weight,
      'activityLevel': data.activityLevel,
      'reasonToLoseWeight': data.reasonToLoseWeight,
      'bodyShape': data.bodyShape,
      'targetWeight': data.targetWeight,
    };

    // Convert the map to JSON
    final jsonData = json.encode(dataMap);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      // Handle success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data submitted successfully!')),
      );

      // Clear the data fields after successful submission
      data.age = null;
      data.gender = null;
      data.height = null;
      data.weight = null;
      data.activityLevel = null;
      data.reasonToLoseWeight = null;
      data.bodyShape = null;
      data.targetWeight = null;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
<<<<<<< HEAD
=======
        actions: const [],
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    // Custom Progress Bar with Percentage
                    Stack(
                      children: [
                        Container(
                          height: 25,
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: screenWidth * 0.8 * 0.5, // 50% progress
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '50%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Chagua aina yako ya mwili wa sasa.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
<<<<<<< HEAD
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildBodyTypeCard(
                      context,
                      'Kawaida',
                      'assets/images/normal1.png',
                    ),
                    _buildBodyTypeCard(
                      context,
                      'Mlegevu',
                      'assets/images/curvy.png',
                    ),
                    _buildBodyTypeCard(
                      context,
                      'Zaidi',
                      'assets/images/big.png',
                    ),
                  ],
                ),
=======
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildBodyTypeCard(
                      context, 'Kawaida', 'assets/images/normal1.png'),
                  _buildBodyTypeCard(
                      context, 'Mlegevu', 'assets/images/curvy.png'),
                  _buildBodyTypeCard(context, 'Zaidi', 'assets/images/big.png'),
                ],
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityLevelSelectionPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(screenWidth * 0.8, 50),
                ),
                child: const Text('NEXT'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBodyTypeCard(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
<<<<<<< HEAD
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityLevelSelectionPage()),
        );
=======
        _submitData(context, title);
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
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
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
<<<<<<< HEAD

void main() {
  runApp(MaterialApp(
    home: BodyTypeSelectionPage(),
  ));
}
=======
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb

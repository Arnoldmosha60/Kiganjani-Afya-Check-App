<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/bodysize.dart';
=======
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb


import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/backend/model/assessment.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/activitylevel.dart';

class WeightScreen extends StatefulWidget {
  final AssessmentData data;

  const WeightScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double? _height;
  double? _weight;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('UREFU / UZITO'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              
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
                    width: screenWidth * 0.8 * 0.3, // 30% progress
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '30%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),

              Image.asset(
<<<<<<< HEAD
                'assets/images/height11.png', // Add your image here
                height: screenHeight * 0.2,
=======
                'assets/images/height11.png',
                height: 150,
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                'UREFU',
                semanticsLabel: 'UREFU / UZITO',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                'Ingiza urefu wako na uzito wako',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),

              // Height entry section
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _height = double.tryParse(value);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Urefu (cm)',
                  hintText: 'Ingiza urefu wako',
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Weight entry section
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _weight = double.tryParse(value);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Uzito (kg)',
                  hintText: 'Ingiza uzito wako',
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              ElevatedButton(
                onPressed: () {
                  if (_height != null && _weight != null) {
                    widget.data.height = _height;
                    widget.data.weight = _weight;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActivityLevelScreen(data: widget.data),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Tafadhali jaza urefu na uzito sahihi'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.2),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.black,
                  elevation: 5,
                ),
                child: const Text('Endelea',
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HeightEntryPage(),
  ));
}

import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/height.dart';

import '../../../backend/model/assessment.dart';
class GenderScreen extends StatefulWidget {

  final AssessmentData data;

   const GenderScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _GenderGroupPageState createState() => _GenderGroupPageState();
}

class _GenderGroupPageState extends State<GenderScreen> {
  String? _gender;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Jinsia',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
<<<<<<< HEAD
              const SizedBox(height: 10),
              // Progress bar
              Column(
                children: [
                  const Text(
                    '01 GOAL & FOCUS',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
=======
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
                  ),
                  SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: 0.1, // Adjust this value based on the progress
                    backgroundColor: Colors.grey[300],
                    color: Colors.blueAccent,
                    minHeight: 6,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'What\'s your gender?',
                style: TextStyle(
                  fontSize: screenWidth * 0.07, // Responsive text size
                  fontWeight: FontWeight.bold,
                ),
<<<<<<< HEAD
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Let us know you better',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive text size
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Gender selection
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedGender = 'male';
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: _selectedGender == 'male'
                                ? Colors.blueAccent.withOpacity(0.1)
                                : Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/male.png', // Replace with your asset image
                            height: screenHeight * 0.25, // Responsive image height
=======
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'CHAGUA JINSIA YAKO',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: const Text('Mwanaume',
                                  style: TextStyle(fontSize: 18),
                                ),
                                leading: Radio<String>(
                                  value: 'male',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Mwanamke',
                                  style: TextStyle(fontSize: 18),
                                ),
                                leading: Radio<String>(
                                  value: 'female',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                              ),
                             ElevatedButton(
                                onPressed: () {
                                  if (_gender != null) {
                                    widget.data.gender = _gender;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WeightScreen(data: widget.data),
                                      ),
                                    );
                                  }
                                },
                                child: Text('Next'),
           ),
                              
                            ],
                            
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
                          ),
                          
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Male',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // Responsive text size
                            fontWeight: FontWeight.bold,
                            color: _selectedGender == 'male'
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedGender = 'female';
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: _selectedGender == 'female'
                                ? Colors.pinkAccent.withOpacity(0.1)
                                : Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/female.png', // Replace with your asset image
                            height: screenHeight * 0.25, // Responsive image height
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // Responsive text size
                            fontWeight: FontWeight.bold,
                            color: _selectedGender == 'female'
                                ? Colors.pinkAccent
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text('Others / I\'d rather not say'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey, textStyle: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive text size
                  ),
                ),
              ),
              const Spacer(),
              // Next button
              ElevatedButton(
                onPressed: _selectedGender.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AgeEntryPage()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.3,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Responsive text size
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}



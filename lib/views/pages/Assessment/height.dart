import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/bodysize.dart';

class HeightEntryPage extends StatefulWidget {
  @override
  _HeightEntryPageState createState() => _HeightEntryPageState();
}

class _HeightEntryPageState extends State<HeightEntryPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _heightErrorText;
  String? _weightErrorText;
  String _selectedHeightUnit = 'cm'; // Default height unit
  String _selectedWeightUnit = 'kg'; // Default weight unit

  @override
  void initState() {
    super.initState();
    _heightErrorText = null;
    _weightErrorText = null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
                'assets/images/height11.png', // Add your image here
                height: screenHeight * 0.2,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Urefu',
                              hintText: 'Ingiza urefu wako',
                              errorText: _heightErrorText,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _heightErrorText = _validateHeight(value)
                                    ? null
                                    : 'Tafadhali ingiza urefu sahihi';
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
                          value: _selectedHeightUnit,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedHeightUnit = newValue!;
                            });
                          },
                          items: <String>['cm', 'ft']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          underline: const SizedBox(),
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Weight entry section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Uzito',
                              hintText: 'Ingiza uzito wako',
                              errorText: _weightErrorText,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _weightErrorText = _validateWeight(value)
                                    ? null
                                    : 'Tafadhali ingiza uzito sahihi';
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
                          value: _selectedWeightUnit,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedWeightUnit = newValue!;
                            });
                          },
                          items: <String>['kg', 'lbs']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          underline: const SizedBox(),
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              ElevatedButton(
                onPressed: () {
                  if (_validateForm()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BodyTypeSelectionPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Tafadhali jaza fomu sahihi')),
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
                    borderRadius: BorderRadius.circular(12), // Rounded edges
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

  bool _validateHeight(String value) {
    if (value.isEmpty) return false;
    final height = double.tryParse(value);
    return height != null && height > 0;
  }

  bool _validateWeight(String value) {
    if (value.isEmpty) return false;
    final weight = double.tryParse(value);
    return weight != null && weight > 0;
  }

  bool _validateForm() {
    return _validateHeight(_heightController.text) &&
        _validateWeight(_weightController.text);
  }
}

void main() {
  runApp(MaterialApp(
    home: HeightEntryPage(),
  ));
}

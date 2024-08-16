import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/HomePage.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/height11.png', // Add your image here
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
              const Text(
                'Ingiza urefu wako na uzito wako',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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

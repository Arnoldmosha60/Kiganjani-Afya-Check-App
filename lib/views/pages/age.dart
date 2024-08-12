import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:kiganjani_afya_check/views/pages/height.dart';

class AgeEntryPage extends StatefulWidget {
  @override
  _AgeEntryPageState createState() => _AgeEntryPageState();
}

class _AgeEntryPageState extends State<AgeEntryPage> {
  String? _selectedCategory;
  int? _selectedAge;
  final List<String> _ageCategories = [
    '0 - 10',
    '11 - 20',
    '21 - 30',
    '31 - 40',
    '41 - 50',
    '51 - 60',
    '61 - 70',
    '71 - 80',
    '81 - 90',
    '91 - 100',
  ];

  List<int> _getAgeRange(String? category) {
    if (category == null) return [];
    List<String> bounds = category.split(' - ');
    int start = int.parse(bounds[0]);
    int end = int.parse(bounds[1]);
    return List<int>.generate(end - start + 1, (i) => start + i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Kiganjani Afya Check', style: TextStyle(color: Colors.black)),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Lottie.asset(
                'assets/animations/gender_animation.json',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'UMRI',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Ingiza umri wako',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text('Chagua kikundi cha umri'),
                        value: _selectedCategory,
                        items: _ageCategories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                            _selectedAge = null; // Reset the selected age
                          });
                        },
                      ),
                      if (_selectedCategory != null) ...[
                        const SizedBox(height: 20),
                        DropdownButton<int>(
                          isExpanded: true,
                          hint: const Text('Chagua umri wako'),
                          value: _selectedAge,
                          items: _getAgeRange(_selectedCategory).map((int age) {
                            return DropdownMenuItem<int>(
                              value: age,
                              child: Text('$age'),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedAge = value;
                            });
                          },
                        ),
                      ],
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_selectedAge != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HeightEntryPage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Tafadhali chagua umri wako')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Rounded edges
                          ),
                          shadowColor: Colors.black,
                          elevation: 5,
                        ),
                        child: const Text(
                          'Endelea',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

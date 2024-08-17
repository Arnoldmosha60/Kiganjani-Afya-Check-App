import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/gender.dart';

import '../../../backend/model/assessment.dart';

class AgeScreen extends StatefulWidget {
  final AssessmentData data;

  const AgeScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int? _age;
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

<<<<<<< HEAD
class AgeEntryPage extends StatefulWidget {
  @override
  _AgeEntryPageState createState() => _AgeEntryPageState();
}

class _AgeEntryPageState extends State<AgeEntryPage> {
  int? _selectedYear;

=======
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
=======
        title: const Text('Enter Age'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Custom Progress Bar with Percentage
              Stack(
                children: [
                  Container(
                    height: 25,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: screenWidth * 0.9 * 0.2, // 20% progress
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '20%',
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
                '02 ABOUT YOUR BODY',
                style: TextStyle(
<<<<<<< HEAD
                  fontSize: 18,
=======
                  fontSize: 32,
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "What's your birth year?",
                style: TextStyle(
<<<<<<< HEAD
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
=======
                  fontSize: 18,
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
<<<<<<< HEAD
              const SizedBox(height: 10),
              const Text(
                "It will help us to adjust the workout that best suits your age group.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
=======
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.cake,
                            size: 80,
                            color: Colors.blue.shade700,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Umri',
                              hintText: 'Ingiza umri wako',
                              errorText: _errorText,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _age = int.tryParse(value);
                                _errorText = (_age == null || _age! <= 0)
                                    ? 'Tafadhali ingiza umri sahihi'
                                    : null;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              if (_age != null && _age! > 0) {
                                widget.data.age = _age;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GenderScreen(data: widget.data),
                                  ),
                                );
                              } else {
                                setState(() {
                                  _errorText = 'Tafadhali ingiza umri sahihi';
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade700,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 32),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              shadowColor: Colors.black,
                              elevation: 5,
                            ),
                            child: const Text('Endelea'),
                          ),
                        ],
                      ),
                    ),
                  ),
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: YearPickerWidget(
                  onYearSelected: (year) {
                    setState(() {
                      _selectedYear = year;
                    });
                  },
                ), // Custom year picker widget
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectedYear != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HeightEntryPage()),
                        );
                      }
                    : null, // Disable button if no year is selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 32),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.black,
                  elevation: 5,
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
}
<<<<<<< HEAD

class YearPickerWidget extends StatefulWidget {
  final ValueChanged<int> onYearSelected;

  YearPickerWidget({required this.onYearSelected});

  @override
  _YearPickerWidgetState createState() => _YearPickerWidgetState();
}

class _YearPickerWidgetState extends State<YearPickerWidget> {
  int _selectedYear = 1999; // Default selected year

  @override
  Widget build(BuildContext context) {
    final List<int> years = List<int>.generate(50, (index) => 1970 + index);

    return ListWheelScrollView.useDelegate(
      itemExtent: 60,
      physics: FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {
        setState(() {
          _selectedYear = years[index];
          widget.onYearSelected(_selectedYear);
        });
      },
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) {
          return Center(
            child: Text(
              years[index].toString(),
              style: TextStyle(
                fontSize: 24,
                color: _selectedYear == years[index]
                    ? Colors.blue.shade700
                    : Colors.grey,
                fontWeight: _selectedYear == years[index]
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          );
        },
        childCount: years.length,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AgeEntryPage(),
  ));
}
=======
>>>>>>> c80490cc9704bd8925016123ecf6255fa27a8dcb

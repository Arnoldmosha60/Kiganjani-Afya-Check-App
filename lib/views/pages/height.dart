import 'package:flutter/material.dart';

class HeightEntryPage extends StatefulWidget {
  @override
  _HeightEntryPageState createState() => _HeightEntryPageState();
}

class _HeightEntryPageState extends State<HeightEntryPage> {
  final TextEditingController _heightController = TextEditingController();
  dynamic _errorText;
  String _selectedUnit = 'cm'; // Default unit

  @override
  void initState() {
    super.initState();
    _errorText = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'KUREFU',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'KUREFU',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Ingiza urefu wako kwa inchi au cm',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Height entry section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
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
                              errorText: _errorText,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _errorText = (_validateHeight(value) ? null : 'Tafadhali ingiza urefu sahihi')!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        DropdownButton<String>(
                          value: _selectedUnit,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedUnit = newValue!;
                            });
                          },
                          items: <String>['cm', 'inchi']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          underline: SizedBox(),
                          icon: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Images representing different heights
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/short_person.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    'assets/images/average_person.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 20),
                  Image.asset(
                    'assets/images/tall_person.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Endelea'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateHeight(String value) {
    if (value.isEmpty) return false;
    final height = int.tryParse(value);
    return height != null && height > 0;
  }
}

void main() {
  runApp(MaterialApp(
    home: HeightEntryPage(),
  ));
}

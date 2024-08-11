import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/height.dart';

class AgeEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20, // Adjust font size for the app bar title
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow to blend with the white background
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'UMRI',
                style: TextStyle(
                  fontSize: 32, // Larger font size for the main heading
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Ingiza umri wako',
                style: TextStyle(
                  fontSize: 18, // Smaller font size for the subheading
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity, // Make the card fill the width of its parent
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400, // Set a maximum width for the card
                  ),
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
                            size: 80, // Reduced icon size
                            color: Colors.blue.shade700,
                          ),
                          SizedBox(height: 20),
                          AgeInputField(),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                         Navigator.push(
                         context,
                    MaterialPageRoute(builder: (context) => HeightEntryPage()),
                  );
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgeInputField extends StatefulWidget {
  @override
  _AgeInputFieldState createState() => _AgeInputFieldState();
}

class _AgeInputFieldState extends State<AgeInputField> {
  final TextEditingController _controller = TextEditingController();
  dynamic _errorText;

  @override
  void initState() {
    super.initState();
    _errorText = null; // Initialize error text as null
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Umri',
        hintText: 'Ingiza umri wako',
        errorText: _errorText,
      ),
      onChanged: (value) {
        setState(() {
          _errorText = (_validateAge(value) ? null : 'Tafadhali ingiza umri sahihi')!;
        });
      },
    );
  }

  bool _validateAge(String value) {
    if (value.isEmpty) return false;
    final age = int.tryParse(value);
    return age != null && age > 0;
  }
}

void main() {
  runApp(MaterialApp(
    home: AgeEntryPage(),
  ));
}

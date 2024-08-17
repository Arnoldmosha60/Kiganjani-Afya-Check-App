import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Recommendation.dart';

void main() {
  runApp(Targetedweight());
}

class Targetedweight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mchaguzi wa Uzito wa Lengo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: TargetWeightPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TargetWeightPage extends StatefulWidget {
  @override
  _TargetWeightPageState createState() => _TargetWeightPageState();
}

class _TargetWeightPageState extends State<TargetWeightPage> {
  double _weight = 70; // Default weight
  double _progress = 0.7; // Progress value (for example purposes)
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weightController.text = _weight.toStringAsFixed(1);
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _updateWeight(double value) {
    setState(() {
      _weight = value;
      _weightController.text = _weight.toStringAsFixed(1);
    });
  }

  void _handleTextChange(String value) {
    final double? newWeight = double.tryParse(value);
    if (newWeight != null && newWeight >= 40 && newWeight <= 150) {
      setState(() {
        _weight = newWeight;
        // Update slider position and text field
        _weightController.text = _weight.toStringAsFixed(1);
      });
    }
  }

  void _submit() {
    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Uzito wa lengo wa ${_weight.toStringAsFixed(1)} kg umechaguliwa!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    // Navigate to the next page
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Recommendation()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Chagua Uzito Wako wa Lengo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Progress Bar with percentage
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 10),
            Text(
              '${(_progress * 100).toInt()}% Completed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Uzito Wako wa Lengo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${_weight.toStringAsFixed(1)} kg',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Slider(
                          value: _weight,
                          min: 40,
                          max: 150,
                          divisions: 110,
                          label: '${_weight.toStringAsFixed(1)} kg',
                          onChanged: (value) {
                            _updateWeight(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Weight (kg)',
                          ),
                          onChanged: _handleTextChange,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: _submit,
          label: const Text('Tuma'),
          icon: const Icon(Icons.check),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/reasonToLooseWeight.dart';

import '../../../backend/model/assessment.dart';

class TargetWeightScreen extends StatefulWidget {
  final AssessmentData data;

  const TargetWeightScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _TargetWeightScreenState createState() => _TargetWeightScreenState();
}

class _TargetWeightScreenState extends State<TargetWeightScreen> {
  double _targetWeight = 50; // Default target weight
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _targetWeight = widget.data.targetWeight ?? 70;
    _weightController.text = _targetWeight.toStringAsFixed(1);
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _updateWeight(double value) {
    setState(() {
      _targetWeight = value;
      _weightController.text = _targetWeight.toStringAsFixed(1);
    });
  }

  void _handleTextChange(String value) {
    final double? newWeight = double.tryParse(value);
    if (newWeight != null && newWeight >= 40 && newWeight <= 150) {
      setState(() {
        _targetWeight = newWeight;
        _weightController.text = _targetWeight.toStringAsFixed(1);
      });
    }
  }

  void _submit() {
    widget.data.targetWeight = _targetWeight;

    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Uzito wa lengo wa ${_targetWeight.toStringAsFixed(1)} kg umechaguliwa!'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    // Navigate to the next page
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReasonToLooseWeight(data: widget.data),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // Target weight card
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(bottom: 20),
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
                    SizedBox(height: 20),
                    Text(
                      '${_targetWeight.toStringAsFixed(1)} kg',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Slider(
                      value: _targetWeight,
                      min: 40,
                      max: 150,
                      divisions: 110,
                      label: '${_targetWeight.toStringAsFixed(1)} kg',
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
                        labelText: 'Ingiza Uzito wa Lengo (kg)',
                      ),
                      onChanged: _handleTextChange,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: _submit,
            label: const Text('Tuma'),
            icon: const Icon(Icons.check),
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

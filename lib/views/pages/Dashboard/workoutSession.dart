import 'package:flutter/material.dart';
import 'dart:async';

class WorkoutSessionPage extends StatefulWidget {
  @override
  _WorkoutSessionPageState createState() => _WorkoutSessionPageState();
}

class _WorkoutSessionPageState extends State<WorkoutSessionPage> {
  int _currentStep = 0;
  int _timeRemaining = 60; // Example duration for each step
  Timer? _timer;

  final List<Map<String, String>> _workoutSteps = [
    {
      'title': 'Kukimbia',
      'description': 'Kukimbia',
      'image': 'assets/images/back2.png'
    },
    {
      'title': 'Kuruka',
      'description': 'Kuruka Kamba',
      'image': 'assets/images/back2.png'
    },
    {
      'title': 'Tembea',
      'description': 'Kutembea Haraka',
      'image': 'assets/images/back2.png'
    },
    {
      'title': 'Push ups',
      'description': 'Push ups',
      'image': 'assets/images/back2.png'
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timeRemaining = 30; // Reset timer to 30 seconds for each step
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _nextStep();
        }
      });
    });
  }

  void _nextStep() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_currentStep < _workoutSteps.length - 1) {
      setState(() {
        _currentStep++;
        _startTimer();
      });
    }
  }

  void _previousStep() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _startTimer();
      });
    }
  }

  void _completeWorkout() {
    if (_timer != null) {
      _timer!.cancel();
    }
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Hongera! Mazoezi ya siku yamekamilika!')),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final step = _workoutSteps[_currentStep];

    return Scaffold(
      appBar: AppBar(
        title: Text('Kipindi cha Mazoezi'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Zoëzi la Sasa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Image.asset(
                    step['image']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step['title']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          step['description']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer, color: Colors.redAccent),
                            const SizedBox(width: 8),
                            Text(
                              '$_timeRemaining seconds remaining',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0) ...[
                  ElevatedButton(
                    onPressed: _previousStep,
                    child: Text('Previous'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                if (_currentStep < _workoutSteps.length - 1) ...[
                  ElevatedButton(
                    onPressed: _nextStep,
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: _completeWorkout,
                    child: Text('Mazoezi ya Siku yamekamilika'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

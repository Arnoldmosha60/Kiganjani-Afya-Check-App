import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/workoutSession.dart';

void main() {
  runApp(WorkoutGuideApp());
}

class WorkoutGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muongozo wa mazoezi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: WorkoutGuidePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WorkoutGuidePage extends StatefulWidget {
  @override
  _WorkoutGuidePageState createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  int _currentStep = 0;

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

  void _startWorkout() {
    // Logic to start the workout, such as navigating to a timer or exercise screen.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Mazoezi yameanza!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mwongozo wako wa Mazoezi'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Karibu kwenye Mwongozo wako wa Mazoezi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fuata Hatua Hizi Ili Kukamilisha Mazoezi Yako:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _workoutSteps.length,
                itemBuilder: (context, index) {
                  final step = _workoutSteps[index];
                  return WorkoutStepCard(
                    title: step['title']!,
                    description: step['description']!,
                    imagePath: step['image']!,
                    isActive: index == _currentStep,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                  // Add action to navigate to additional resources or next steps
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutSessionPage()),
                  );
                },
              child: Text('Anza Mazoezi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutStepCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isActive;

  const WorkoutStepCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isActive ? Colors.blueAccent : Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

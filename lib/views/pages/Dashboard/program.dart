import 'package:flutter/material.dart';

void main() {
  runApp(MagicWeightLossProgram());
}

class MagicWeightLossProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Weight Loss Program',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: ProgramPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProgramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Magic Weight Loss Program'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: 'Today\'s Meals'),
            MealInputSection(),
            const SizedBox(height: 20),
            SectionHeader(title: 'Recommended Exercises'),
            ExerciseRecommendationSection(),
            const SizedBox(height: 20),
            SectionHeader(title: 'Results'),
            ResultsSection(),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}

class MealInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealInputField(mealType: 'Breakfast'),
            MealInputField(mealType: 'Lunch'),
            MealInputField(mealType: 'Dinner'),
          ],
        ),
      ),
    );
  }
}

class MealInputField extends StatelessWidget {
  final String mealType;

  const MealInputField({required this.mealType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealType,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter $mealType details',
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseRecommendationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExerciseRecommendationField(
              exerciseType: 'Walking',
              distance: '5 km',
              speed: '5 km/h',
              time: '60 min',
              calories: '300 kcal',
            ),
            ExerciseRecommendationField(
              exerciseType: 'Jumping',
              distance: 'N/A',
              speed: 'N/A',
              time: '15 min',
              calories: '200 kcal',
            ),
            ExerciseRecommendationField(
              exerciseType: 'Running',
              distance: '3 km',
              speed: '8 km/h',
              time: '30 min',
              calories: '400 kcal',
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseRecommendationField extends StatelessWidget {
  final String exerciseType;
  final String distance;
  final String speed;
  final String time;
  final String calories;

  const ExerciseRecommendationField({
    required this.exerciseType,
    required this.distance,
    required this.speed,
    required this.time,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exerciseType,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Distance: $distance'),
          Text('Speed: $speed'),
          Text('Time: $time'),
          Text('Calories Expected to Burn: $calories'),
        ],
      ),
    );
  }
}

class ResultsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Calories Burned Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Calories Burned: 900 kcal',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Weight Reduction: 0.1 kg',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

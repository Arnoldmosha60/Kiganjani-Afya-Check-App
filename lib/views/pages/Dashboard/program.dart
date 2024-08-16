import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/HomePage.dart';

void main() {
  runApp(MagicWeightLossProgram());
}

class MagicWeightLossProgram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mpango wa Kupunguza Uzito kimuujiza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: ProgramPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProgramPage extends StatefulWidget {
  @override
  _ProgramPageState createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  final List<String> _breakfastMeals = [];
  final List<String> _lunchMeals = [];
  final List<String> _dinnerMeals = [];
  final TextEditingController _mealController = TextEditingController();
  String _selectedMealType = 'Breakfast';
  bool _showRecommendations = false;
  bool _isSubmitEnabled = false;

  @override
  void dispose() {
    _mealController.dispose();
    super.dispose();
  }

  void _addMeal(String meal) {
    if (meal.isNotEmpty) {
      setState(() {
        switch (_selectedMealType) {
          case 'Breakfast':
            if (!_breakfastMeals.contains(meal)) _breakfastMeals.add(meal);
            break;
          case 'Lunch':
            if (!_lunchMeals.contains(meal)) _lunchMeals.add(meal);
            break;
          case 'Dinner':
            if (!_dinnerMeals.contains(meal)) _dinnerMeals.add(meal);
            break;
        }
        _mealController.clear();
        _checkMealCompletion();
      });
    }
  }

  void _checkMealCompletion() {
    if (_breakfastMeals.isNotEmpty &&
        _lunchMeals.isNotEmpty &&
        _dinnerMeals.isNotEmpty) {
      setState(() {
        _isSubmitEnabled = true;
      });
    } else {
      setState(() {
        _isSubmitEnabled = false;
      });
    }
  }

  void _onMealTypeChanged(String? type) {
    setState(() {
      _selectedMealType = type ?? 'Breakfast';
    });
  }

  void _submitMeals() {
    setState(() {
      _showRecommendations = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Mpango wa Kupunguza Uzito kimuujiza'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: 'Mlo wa Leo'),
            MealInputSection(
              mealController: _mealController,
              onAddMeal: _addMeal,
              meals: {
                'Breakfast': _breakfastMeals,
                'Lunch': _lunchMeals,
                'Dinner': _dinnerMeals,
              },
              selectedMealType: _selectedMealType,
              onMealTypeChanged: _onMealTypeChanged,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isSubmitEnabled ? _submitMeals : null,
              child: Text('Wasilisha Mlo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            if (_showRecommendations) ...[
              const ResultCard(
                caloriesGained: 1200,
                caloriesBurned: 800,
                unburnedCalories: 400,
              ),
              const SizedBox(height: 20),
              SectionHeader(title: 'Mazoezi Yanayopendekezwa'),
              ExerciseRecommendationSection(),
              const SizedBox(height: 20),
            ],
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Rudi kwenye Ukurasa wa Nyumbani'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
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
        color: Colors.blue,
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final int caloriesGained;
  final int caloriesBurned;
  final int unburnedCalories;

  const ResultCard({
    required this.caloriesGained,
    required this.caloriesBurned,
    required this.unburnedCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Matokeo ya Kalori',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Kalori Zilizopatikana: $caloriesGained'),
            Text('Kalori Zilizochomwa: $caloriesBurned'),
            Text('Kalori Zisizochomwa: $unburnedCalories'),
            const SizedBox(height: 10),
            // Placeholder for the chart, you can integrate a real chart here.
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.purple.withOpacity(0.1),
              child: Center(
                child: Text(
                  'Mchoro wa Kalori Zisizochomwa',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealInputSection extends StatelessWidget {
  final TextEditingController mealController;
  final Function(String) onAddMeal;
  final Map<String, List<String>> meals;
  final String selectedMealType;
  final ValueChanged<String?> onMealTypeChanged;

  const MealInputSection({
    required this.mealController,
    required this.onAddMeal,
    required this.meals,
    required this.selectedMealType,
    required this.onMealTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedMealType,
              onChanged: onMealTypeChanged,
              items: <String>['Breakfast', 'Lunch', 'Dinner']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              isExpanded: true,
              underline: SizedBox(),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: mealController,
              decoration: InputDecoration(
                labelText: 'Tafuta au Weka Mlo',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => onAddMeal(mealController.text),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (meals[selectedMealType]!.isNotEmpty) ...[
              Text(
                '${selectedMealType} Zilizoongezwa:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: meals[selectedMealType]!
                    .map(
                      (meal) => Card(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/$meal.png'),
                          ),
                          title: Text(meal),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ExerciseRecommendationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes the container take up full width
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExerciseRecommendationField(
                exerciseType: 'Kutembea',
                distance: '5 km',
                speed: '5 km/h',
                time: '60 min',
                calories: '300 kcal',
              ),
              ExerciseRecommendationField(
                exerciseType: 'Kuruka',
                distance: 'N/A',
                speed: 'N/A',
                time: '30 min',
                calories: '250 kcal',
              ),
              ExerciseRecommendationField(
                exerciseType: 'Kukimbia',
                distance: '3 km',
                speed: '10 km/h',
                time: '20 min',
                calories: '350 kcal',
              ),
            ],
          ),
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
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exerciseType,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 5),
          Text('Umbali: $distance'),
          Text('Kasi: $speed'),
          Text('Muda: $time'),
          Text('Kalori: $calories'),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Picture and Name
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'User.name',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text(
                  'Target Weight: 70 kg',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),

              // Progress Overview
              const Text(
                'Progress Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Center(
                child: CircularProgressIndicator(
                  value: 0.7, // Replace with actual progress value
                  strokeWidth: 10,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMetric('Current Weight', '75 kg'),
                  _buildMetric('Total Lost', '5 kg'),
                ],
              ),
              const SizedBox(height: 24),

              // Recent Activities
              const Text(
                'Recent Activities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildActivityList(),
              const SizedBox(height: 24),

              // Diet and Nutrition
              const Text(
                'Diet and Nutrition',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildNutritionChart(),
              const SizedBox(height: 24),

              // Social and Community
              const Text(
                'Community Challenges',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildCommunityChallenges(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetric(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActivityList() {
    return Column(
      children: [
        _buildActivityCard('Morning Run', '5 km', '250 cal'),
        _buildActivityCard('Yoga', '30 min', '100 cal'),
        _buildActivityCard('Cycling', '10 km', '300 cal'),
      ],
    );
  }

  Widget _buildActivityCard(String activity, String distance, String calories) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.directions_run),
        title: Text(activity),
        subtitle: Text('$distance, $calories'),
      ),
    );
  }

  Widget _buildNutritionChart() {
    // Placeholder for a pie chart or bar graph
    return Container(
      height: 150,
      color: Colors.blue[50],
      child: const Center(
        child: Text('Nutrition Chart Placeholder'),
      ),
    );
  }

  Widget _buildCommunityChallenges() {
    // Placeholder for community challenges
    return Column(
      children: [
        _buildChallengeCard('Step Up Challenge', 'Join the challenge to walk 10,000 steps daily!'),
        _buildChallengeCard('Hydration Challenge', 'Drink 2L of water every day for a week.'),
      ],
    );
  }

  Widget _buildChallengeCard(String title, String description) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.fitness_center),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/TargetedWeight.dart';

class ActivityLevelSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Select Your Activity Level',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildActivityLevelCard(
                    context,
                    'Kukaa tu',
                    'assets/images/customer-service.png',
                    'Mazoezi kidogo au hakuna kabisa.',
                  ),
                  _buildActivityLevelCard(
                    context,
                    'Mazoezi Kidogo.',
                    'assets/images/customer-service.png',
                    'Mazoezi mepesi/michezo siku 1-3 kwa wiki..',
                  ),
                  _buildActivityLevelCard(
                    context,
                    'Mazoezi ya Kati.',
                    'assets/images/customer-service.png',
                    'Mazoezi ya kati/michezo siku 3-5 kwa wiki.',
                  ),
                  _buildActivityLevelCard(
                    context,
                    'Mazoezi Mengi.',
                    'assets/images/customer-service.png',
                    'Mazoezi makali/michezo siku 6-7 kwa wiki.',
                  ),
                  _buildActivityLevelCard(
                    context,
                    'Mwenye Mazoezi Zaidi',
                    'assets/images/customer-service.png',
                    'Mazoezi makali sana/michezo na kazi za kimwili.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityLevelCard(
      BuildContext context, String title, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        // Handle card tap, e.g., navigate to another page or show a confirmation
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Targetedweight(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                imagePath,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
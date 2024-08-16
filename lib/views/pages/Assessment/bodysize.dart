import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/activitylevel.dart';

class BodyTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: const [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Chagua aina yako ya mwili wa sasa.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildBodyTypeCard(
                    context,
                    'Kawaida',
                    'assets/images/normal1.png',
                  ),
                  _buildBodyTypeCard(
                    context,
                    'Mlegevu',
                    'assets/images/curvy.png',
                  ),
                  _buildBodyTypeCard(
                    context,
                    'Zaidi',
                    'assets/images/big.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyTypeCard(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityLevelSelectionPage()), // Replace `NextPage` with the appropriate page
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
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
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



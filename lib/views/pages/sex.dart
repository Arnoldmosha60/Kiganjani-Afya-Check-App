import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/age.dart';

class AgeGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'JINSIA',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'CHAGUA JINSIA YAKO',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: <Widget>[
                    _buildAgeGroupCard(
                      context,
                      'assets/images/male.png',
                      'KIUME',
                      AgeEntryPage(), // Replace with your actual page
                    ),
                    _buildAgeGroupCard(
                      context,
                      'assets/images/female.png',
                      'KIKE',
                      AgeEntryPage(), // Replace with your actual page
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Kwa kuendelea, unathibitisha na kuhakikisha kuwa umesoma, umeelewa, na umekubaliana na Masharti ya Matumizi, Sera ya Faragha, na Sera ya Marejesho yetu.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgeGroupCard(BuildContext context, String imagePath, String label, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Column(
        children: <Widget>[
          // Increased Image Height to 250
          Image.asset(
            imagePath,
            height: 100,
            fit: BoxFit.contain,
          ),
          // Removed SizedBox to reduce space between image and card
          // The Card, now touching the image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue.shade700,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}




void main() {
  runApp(MaterialApp(
    home: AgeGroupPage(),
  ));
}

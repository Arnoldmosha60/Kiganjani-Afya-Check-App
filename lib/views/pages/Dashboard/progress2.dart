import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HealthDashboardPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HealthDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BMI Section
              BMISection(),
              SizedBox(height: 20),
              // Today's Target Section
              TargetSection(),
              SizedBox(height: 20),
              // Activity Status Section
              ActivityStatusSection(),
              SizedBox(height: 20),
              // Water Intake & Sleep Sections
              Row(
                children: [
                  Expanded(child: CaloriesIntakeSection()),
                  SizedBox(width: 10),
                  Expanded(child: CaloriesBurnedSection()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BMISection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BMI (Body Mass Index)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              const Text(
                'Una uzito wa juu',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Angalia zaidi'),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 100,
            height: 100,
            child: const CircularProgressIndicator(
              value: 0.7,
              strokeWidth: 8,
              color: Colors.blueGrey,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class TargetSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Malengo ya Leo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Tizama'),
          ),
        ],
      ),
    );
  }
}

class ActivityStatusSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 100,
            width: double.infinity,
            child: CustomPaint(
              painter: ActivityChartPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class CaloriesIntakeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kiasi cha Kalori',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Leo',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Today updates',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Asubuhi: 350kcal',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Text(
            'Mchana: 500kcal',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
             Text(
            'Usiku: 400kcal',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CaloriesBurnedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kalori Zilizochomwa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            ' Leo',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Mazoezi: 400kcal',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Kufunga: 200kcal',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
            Text(
            'Lishe: 200kcal',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.4)
      ..lineTo(size.width * 0.4, size.height * 0.7)
      ..lineTo(size.width * 0.6, size.height * 0.5)
      ..lineTo(size.width * 0.8, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.4);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

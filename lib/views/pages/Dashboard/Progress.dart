import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/progress2.dart';

class MaendeleoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maendeleo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blueGrey],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: <Widget>[
                      Text(
                        'Mafanikio Yako',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Umefanikiwa kupunguza uzito kwa kasi kubwa! Endelea kushikilia ratiba ya mazoezi na lishe bora ili kufikia malengo yako ya kiafya.',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false), // Hide grid lines if you don't need them
                      titlesData: const FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false), // Hide left titles
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false), // Hide bottom titles
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.transparent), // Hide border
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 5),
                            FlSpot(1, 4),
                            FlSpot(2, 3),
                            FlSpot(3, 2.5),
                            FlSpot(4, 2),
                            FlSpot(5, 1.5),
                          ],
                          isCurved: true,
                          barWidth: 4,
                          color: Colors.blueGrey,
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.blueGrey.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Kuwa na azma ya kufikia malengo yako ya kupunguza uzito! Maendeleo yako yameonekana na unakaribia kufikia lengo lako la kiafya.',
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthDashboardPage()),
                  ); // Close the drawer
                    // Add action for detailed progress tracking
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.blueAccent,
                    elevation: 10,
                  ),
                  child: const Text(
                    'Angalia Maendeleo Zaidi',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MaendeleoPage(),
  ));
}

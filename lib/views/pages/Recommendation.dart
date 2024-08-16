import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/main.dart';
import 'package:kiganjani_afya_check/views/pages/Dashboard/HomePage.dart';

void main() {
  runApp(Recommendation());
}

class Recommendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matokeo na Mapendekezo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: ResultsPage(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class ResultsPage extends StatelessWidget {
  // Example data (replace with real data)
  final double currentWeight = 78;
  final double height = 1.75; // Height in meters
  final double targetWeight = 70;

  @override
  Widget build(BuildContext context) {
    // Calculate BMI
    final double bmi = currentWeight / (height * height);
    final String bmiCategory = _getBmiCategory(bmi);

    // WHO Recommended Weight Range
    final double minNormalWeight = 18.5 * (height * height);
    final double maxNormalWeight = 24.9 * (height * height);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Matokeo & Mapendekezo'),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Results Card
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Matokeo Yako',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 16),
                            const Row(
                              children: [
                                Icon(Icons.trending_up, color: Colors.green, size: 40),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Hongera sana kwa kuchukua hatua ya kujua hali yako ya kiafya.',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Uzito wa sasa: $currentWeight kg',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'BMI: ${bmi.toStringAsFixed(1)} ($bmiCategory)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Uzito wa Lengo: $targetWeight kg',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 16),
                            const Text(
                              'Uzito uliopendekezwa na WHO:',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${minNormalWeight.toStringAsFixed(1)} kg - ${maxNormalWeight.toStringAsFixed(1)} kg',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Recommendations Card
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mapendekezo',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 16),
                            ListTile(
                              leading: Icon(Icons.local_hospital, color: Colors.blue),
                              title: Text('Ushauri wa kiafya'),
                              subtitle: Text('Hali yako ya uzito inakuweka katika hatari kubwa ya kupata magonjwa.'),
                            ),
                            ListTile(
                              leading: Icon(Icons.food_bank, color: Colors.blue),
                              title: Text('Fuata lishe yenye usawa.'),
                              subtitle: Text('Jumuisha matunda, mboga, na protini nyepesi zaidi katika lishe yako.'),
                            ),
                            ListTile(
                              leading: Icon(Icons.directions_run, color: Colors.blue),
                              title: Text('Program ya kupunguza uzito'),
                              subtitle: Text('Tunakushauri kujiunga kwenye mpango wetu wa kupunguza uzito wako.'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Action Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add navigation or action here
                            },
                            child: Text('Tazama Ripoti ya Kina'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage()), // Replace `NextPage` with the appropriate page
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: Text('Anza Program'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to determine BMI category
  String _getBmiCategory(double bmi) {
    if (bmi < 18.5) return 'Uzito Mdogo Sana';
    if (bmi < 24.9) return 'Uzito wa Kawaida';
    if (bmi < 29.9) return 'Uzito wa Juu';
    return 'Uzito wa Hatari';
  }
}

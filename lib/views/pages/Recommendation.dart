import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kiganjani_afya_check/main.dart';

void main() {
  runApp(MyApp());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Matokeo & Mapendekezo'),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
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
              child: const Padding(
                padding: EdgeInsets.all(20.0),
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
                    Row(
                      children: [
                        Icon(Icons.trending_up, color: Colors.green, size: 40),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Hongera sana kwa kuchukua hatua ya kujua kujua hali yako ya kiafya.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Uzito wa sasa: 78 kg',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Uzito wa Lengo: 70 kg',
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
                      subtitle: Text('Hali yako ya uzito inakuweka katika hatari kubwa ya kupata magonjwa zaidi ya 30 ikiwepo magonjwa ya moyo, kisukari, shinikizo la damu, kiharusi na mengine mengi ikiwepo kansa'),
                    ),
                    ListTile(
                      leading: Icon(Icons.food_bank, color: Colors.blue),
                      title: Text('Fuata lishe yenye usawa.'),
                      subtitle: Text('Jumuisha matunda, mboga, na protini nyepesi zaidi katika lishe yako.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.directions_run, color: Colors.blue),
                      title: Text('Program ya kupunguza uzito'),
                      subtitle: Text('Tunakushauri kujiunga kwenye mpango wetu wa kupunguza uzito wako and pia kujiunga kwenye shindano la kupata tuzo ya mpungua uzito bora Tanzania na kujishindia zawadi nono'),
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
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Add navigation or action here
                    },
                    child: Text('Anza Program'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

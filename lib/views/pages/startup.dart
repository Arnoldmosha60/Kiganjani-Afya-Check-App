import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/selectProgram.dart';
import 'package:kiganjani_afya_check/views/pages/sex.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/back2.png', // Add a fitness-related background image
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3), // Darken the image for text contrast
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60), // Space for the top of the screen
                  Text(
                    'Hongera kwa kuchukua hatua ya kwanza kuelekea wewe mwenye afya bora!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Safari yako ya kufikia malengo yako ya kupunguza uzito inaanza sasa.\n\n'
                    'Baki na moyo, baki kuwa na matumaini, na jione ukibadilika!\n\n'
                    'Kumbuka, kila hatua ndogo ina hesabu kuelekea mafanikio makubwa.\n\n'
                    'Unaweza! Kubali safari na sherehekea kila mafanikio.\n\n'
                    'Jitolee kwa malengo yako na kuwa na uthabiti – mwenyewe wa baadaye atakushukuru!\n\n'
                    'Amini mwenyewe na uwezo wako wa kufanya mabadiliko chanya.\n\n'
                    'Jiandae kuanza safari yenye matokeo yenye afya bora na ustawi!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Checkbox(
                        value: _isAccepted,
                        onChanged: (value) {
                          setState(() {
                            _isAccepted = value!;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.blue.shade700,
                      ),
                      Expanded(
                        child: Text(
                          'Nakubali masharti na masharti',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _isAccepted
                        ? () {
                                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectProgram()),
              );
                            // Handle start button press
                          }
                        : null, // Disable the button if the terms are not accepted
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: Text('Anza Sasa'),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Remove the debug banner
    home: StartPage(),
  ));
}

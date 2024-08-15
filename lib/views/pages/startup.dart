import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/selectProgram.dart';

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine sizes based on available height and width
            final double height = constraints.maxHeight;
            final double width = constraints.maxWidth;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.05),
                  Text(
                    'Hongera kwa kuchukua hatua ya kwanza kuelekea wewe mwenye afya bora!',
                    style: TextStyle(
                      fontSize: width * 0.06, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Safari yako ya kufikia malengo yako ya kupunguza uzito inaanza sasa.\n\n'
                        'Baki na moyo, baki kuwa na matumaini, na jione ukibadilika!\n\n'
                        'Kumbuka, kila hatua ndogo ina hesabu kuelekea mafanikio makubwa.\n\n'
                        'Unaweza! Kubali safari na sherehekea kila mafanikio.\n\n'
                        'Jitolee kwa malengo yako na kuwa na uthabiti – mwenyewe wa baadaye atakushukuru!\n\n'
                        'Amini mwenyewe na uwezo wako wa kufanya mabadiliko chanya.\n\n'
                        'Jiandae kuanza safari yenye matokeo yenye afya bora na ustawi!',
                        style: TextStyle(
                          fontSize: width * 0.045, // Responsive font size
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
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
                            fontSize: width * 0.04, // Responsive font size
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  ElevatedButton(
                    onPressed: _isAccepted
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectProgram()),
                            );
                          }
                        : null, // Disable the button if the terms are not accepted
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.02,
                        horizontal: width * 0.2,
                      ),
                      textStyle: TextStyle(
                        fontSize: width * 0.05, // Responsive font size
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 5,
                    ),
                    child: const Text('Anza Sasa'),
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            );
          },
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

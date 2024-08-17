import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/height.dart';

import '../../../backend/model/assessment.dart';
class GenderScreen extends StatefulWidget {

  final AssessmentData data;

   const GenderScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _GenderGroupPageState createState() => _GenderGroupPageState();
}

class _GenderGroupPageState extends State<GenderScreen> {
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Jinsia',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'CHAGUA JINSIA YAKO',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: const Text('Mwanaume',
                                  style: TextStyle(fontSize: 18),
                                ),
                                leading: Radio<String>(
                                  value: 'male',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Mwanamke',
                                  style: TextStyle(fontSize: 18),
                                ),
                                leading: Radio<String>(
                                  value: 'female',
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value!;
                                    });
                                  },
                                ),
                              ),
                             ElevatedButton(
                                onPressed: () {
                                  if (_gender != null) {
                                    widget.data.gender = _gender;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WeightScreen(data: widget.data),
                                      ),
                                    );
                                  }
                                },
                                child: Text('Next'),
           ),
                              
                            ],
                            
                          ),
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
}



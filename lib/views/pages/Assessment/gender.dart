import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/age.dart';

class AgeGroupPage extends StatefulWidget {
  @override
  _AgeGroupPageState createState() => _AgeGroupPageState();
}

class _AgeGroupPageState extends State<AgeGroupPage> {
  String _selectedGender = '';

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
                  gradient: LinearGradient(
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
                      Text(
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
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value!;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AgeEntryPage()),
                                    );
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Mwanamke',
                                  style: TextStyle(fontSize: 18),
                                ),
                                leading: Radio<String>(
                                  value: 'female',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value!;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AgeEntryPage()),
                                    );
                                  },
                                ),
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

void main() {
  runApp(MaterialApp(
    home: AgeGroupPage(),
  ));
}

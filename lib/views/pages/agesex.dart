import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/heightweight.dart';

class AgeSexPage extends StatefulWidget {
  @override
  _AgeSexPageState createState() => _AgeSexPageState();
}

class _AgeSexPageState extends State<AgeSexPage> {
  final _ageController = TextEditingController();
  String _sex = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Age and Sex')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Male'),
                    leading: Radio<String>(
                      value: 'Male',
                      groupValue: _sex,
                      onChanged: (value) {
                        setState(() {
                          _sex = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Female'),
                    leading: Radio<String>(
                      value: 'Female',
                      groupValue: _sex,
                      onChanged: (value) {
                        setState(() {
                          _sex = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeightWeightPage(
                      age: _ageController.text,
                      sex: _sex,
                    ),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

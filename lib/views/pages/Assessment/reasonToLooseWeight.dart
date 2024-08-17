import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/bodysize.dart';

import '../../../backend/model/assessment.dart';

class ReasonToLooseWeight extends StatefulWidget {
  final AssessmentData data;

  ReasonToLooseWeight({required this.data});

  @override
  _ReasonScreenState createState() => _ReasonScreenState();
}

class _ReasonScreenState extends State<ReasonToLooseWeight> {
  String? _reasonToLoseWeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter the Reason To Loose Weight')),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _reasonToLoseWeight = value;
              });
            },
            decoration: InputDecoration(labelText: 'Reason To Loose Weight'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_reasonToLoseWeight != null) {
                widget.data.reasonToLoseWeight = _reasonToLoseWeight;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BodySizeScreen(data: widget.data),
                  ),
                );
              }
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

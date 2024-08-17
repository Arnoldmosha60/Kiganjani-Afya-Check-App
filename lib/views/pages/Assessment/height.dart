// import 'package:flutter/material.dart';
// import 'package:kiganjani_afya_check/backend/model/assessment.dart';
// import 'package:kiganjani_afya_check/views/pages/Assessment/activitylevel.dart';

// class WeightScreen extends StatefulWidget {
//   final AssessmentData data;

//   WeightScreen({required this.data});

//   @override
//   _WeightScreenState createState() => _WeightScreenState();
// }

// class _WeightScreenState extends State<WeightScreen> {
//   double? _weight;
//   double? _height;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('UREFU')),
//       body: Column(
//         children: [
//           TextField(
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               _height = double.tryParse(value);
//             },
//             decoration: InputDecoration(labelText: 'Urefu'),
//           ),
//           TextField(
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               _weight = double.tryParse(value);
//             },
//             decoration: InputDecoration(labelText: 'Weight'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (_weight != null && _height != null) {
//                 widget.data.weight = _weight;
//                 widget.data.height = _height;
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         ActivityLevelScreen(data: widget.data),
//                   ),
//                 );
//               } else {
//                 // Show an error message if either field is not filled
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Please enter both height and weight'),
//                   ),
//                 );
//               }
//             },
//             child: Text('Next'),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/backend/model/assessment.dart';
import 'package:kiganjani_afya_check/views/pages/Assessment/activitylevel.dart';

class WeightScreen extends StatefulWidget {
  final AssessmentData data;

  const WeightScreen({super.key, required this.data});

  @override
  // ignore: library_private_types_in_public_api
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double? _height;
  double? _weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UREFU / UZITO'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/height11.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'UREFU',
                semanticsLabel: 'UREFU / UZITO',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Ingiza urefu wako na uzito wako',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Height entry section
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _height = double.tryParse(value);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Urefu (cm)',
                  hintText: 'Ingiza urefu wako',
                ),
              ),
              const SizedBox(height: 20),
              // Weight entry section
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _weight = double.tryParse(value);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Uzito (kg)',
                  hintText: 'Ingiza uzito wako',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_height != null && _weight != null) {
                    widget.data.height = _height;
                    widget.data.weight = _weight;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActivityLevelScreen(data: widget.data),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Tafadhali jaza urefu na uzito sahihi'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.black,
                  elevation: 5,
                ),
                child: const Text('Endelea',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

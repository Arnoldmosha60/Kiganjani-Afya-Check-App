import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kiganjani_afya_check/backend/model/assessment.dart';


class ApiService {
  static const String baseUrl = 'http://192.168.1.158:8080'; 

  // static Future<void> saveAssessment(AssessmentData assessment) async {
  //   final url = Uri.parse('$baseUrl/assessment/save');
  //   final response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(assessment.toMap()),
  //   );

  //   if (response.statusCode == 200) {
  //     print('Assessment saved successfully');
  //   } else {
  //     throw Exception('Failed to save assessment');
  //   }
  // }
}

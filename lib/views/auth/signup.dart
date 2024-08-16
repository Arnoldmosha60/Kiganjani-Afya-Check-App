import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiganjani_afya_check/views/auth/signin.dart';
import 'package:kiganjani_afya_check/views/pages/startup.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

import '../../backend/model/user.dart';
import '../../theme/theme.dart';
import '../../widget/custom_scaffold.dart';
import '../../widget/logo.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formSignupKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool agreePersonalData = false;

  Future<void> registerUser(User user) async {
    const String apiUrl = 'http://192.168.1.158:8080/user/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: userToJson(user),
      );

      if (response.statusCode == 200) {
        // Show success AnimatedSnackBar
        AnimatedSnackBar.material(
          'Usajili Umefaulu 🎉',
          type: AnimatedSnackBarType.success,
          duration: const Duration(seconds: 5),
          mobileSnackBarPosition: MobileSnackBarPosition.top,
        ).show(context);

        // Navigate to StartPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartPage()),
        );
      } else if (response.statusCode == 400) {
        // Show warning AnimatedSnackBar if email already exists
        AnimatedSnackBar.material(
          'Barua pepe tayari ipo ',
          type: AnimatedSnackBarType.warning,
          duration: const Duration(seconds: 5),
          mobileSnackBarPosition: MobileSnackBarPosition.top,
        ).show(context);
      } else if (response.statusCode == 500) {
        // Show failure AnimatedSnackBar
        AnimatedSnackBar.material(
          'Usajili Umeshindikana',
          type: AnimatedSnackBarType.error,
          duration: const Duration(seconds: 5),
          mobileSnackBarPosition: MobileSnackBarPosition.top,
        ).show(context);
      }
    } catch (e) {
      // Handle network or other errors
      if (mounted) {
        AnimatedSnackBar.material(
          'Error occurred in the server',
          type: AnimatedSnackBarType.error,
          duration: const Duration(seconds: 5),
          mobileSnackBarPosition: MobileSnackBarPosition.top,
        ).show(context);
      }
    }
  }

  String userToJson(User user) {
    return jsonEncode({
      'email': user.email,
      'fullName': user.fullName,
      'userPassword': user.userPassword,
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // Get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Get started text
                      Text(
                        'Anza Sasa',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // Full name
                      TextFormField(
                        controller: _fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tafadhali ingiza Jina Kamili';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Jina Kamili'),
                          hintText: 'Ingiza Jina Kamili',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      // Email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tafadhali ingiza Barua Pepe';
                          }
                          // Regular expression for validating email
                          String pattern = r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'
                              '*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'Tafadhali ingiza Barua Pepe sahihi';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Barua pepe'),
                          hintText: 'Ingiza Barua Pepe',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      // Password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tafadhali ingiza nenosiri';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Nenosiri'),
                          hintText: 'Ingiza Nenosiri',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // Agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'Ninakubali usindikaji wa',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Taarifa za Kibinafsi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // Sign-up button
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formSignupKey.currentState!.validate() &&
                                  agreePersonalData) {
                                final User user = User(
                                  email: _emailController.text,
                                  fullName: _fullNameController.text,
                                  userPassword: _passwordController.text,
                                );

                                registerUser(user);
                              } else {
                                AnimatedSnackBar.material(
                                  'Tafadhali jaza sehemu zote na kubali usindikaji wa taarifa za kibinafsi',
                                  type: AnimatedSnackBarType.warning,
                                  duration: const Duration(seconds: 5),
                                  mobileSnackBarPosition:
                                      MobileSnackBarPosition.bottom,
                                ).show(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightColorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: const Text(
                              'Jisajili',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // Sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Jisajili kwa',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(FontAwesomeIcons.facebookF),
                          Logo(FontAwesomeIcons.twitter),
                          Logo(FontAwesomeIcons.google),
                          Logo(FontAwesomeIcons.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // Already have an account?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Tayari una akaunti? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Ingia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

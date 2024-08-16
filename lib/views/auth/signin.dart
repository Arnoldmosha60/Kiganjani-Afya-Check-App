import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiganjani_afya_check/backend/model/login.dart';
import 'package:kiganjani_afya_check/views/auth/signup.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:http/http.dart' as http;

import '../../theme/theme.dart';
import '../../widget/custom_scaffold.dart';
import '../../widget/logo.dart';
import '../pages/Dashboard/HomePage.dart';
import '../pages/startup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberPassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formSignupKey = GlobalKey<FormState>();

  Future<void> loginUser(Login login) async {
    const String apiUrl = 'http://192.168.1.158:8080/authenticate';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: userToJson(login),
      );

      if (response.statusCode == 200) {
        // Show success AnimatedSnackBar
        AnimatedSnackBar.material(
          'Karibu! Usajili Umefaulu 🎉',
          type: AnimatedSnackBarType.success,
          duration: const Duration(seconds: 5),
          mobileSnackBarPosition: MobileSnackBarPosition.top,
        ).show(context);

        // Navigate to StartPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => StartPage()),
        );
      } else if (response.statusCode == 500) {
        // Show failure AnimatedSnackBar
        AnimatedSnackBar.material(
          'Ingiza taarifa sahihi',
          type: AnimatedSnackBarType.warning,
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

  String userToJson(Login login) {
    return jsonEncode({
      'email': login.email,
      'userPassword': login.userPassword,
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
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'KARIBU',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
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
                          label: const Text('Barua Pepe'),
                          hintText: 'Ingiza Barua Pepe',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tafadhali ingiza Nenosiri';
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: lightColorScheme.primary,
                              ),
                              const Text(
                                'Nikumbuke',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Sahau nenosiri?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignupKey.currentState!.validate()) {
                              final Login login = Login(
                                email: _emailController.text,
                                userPassword: _passwordController.text,
                              );

                              loginUser(login);
                            } else {
                              AnimatedSnackBar.material(
                                'Tafadhali jaza sehemu zote ili kuendelea',
                                type: AnimatedSnackBarType.warning,
                                duration: const Duration(seconds: 5),
                                mobileSnackBarPosition:
                                    MobileSnackBarPosition.bottom,
                              ).show(context);

                            }
                          },
                          child: const Text('Ingia'),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
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
                              'Ingia kwa',
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
                        height: 25.0,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Huna akaunti? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignupPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Jisajili',
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

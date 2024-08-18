import 'package:flutter/material.dart';
import 'package:kiganjani_afya_check/views/auth/signin.dart';
import 'package:kiganjani_afya_check/views/auth/signup.dart';

import '../../theme/theme.dart';
import '../../widget/custom_scaffold.dart';
import '../../widget/welcome_button.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02, // Adjust padding based on screen height
                horizontal: screenWidth * 0.1,  // Adjust padding based on screen width
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Karibu Tena!\n',
                        style: TextStyle(
                          fontSize: screenWidth * 0.1, // Adjust font size based on screen width
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\nIngiza maelezo binafsi ili kuendelea na programu',
                        style: TextStyle(
                          fontSize: screenWidth * 0.05, // Adjust font size based on screen width
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Ingia',
                      onTap: LoginPage(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Jisajili',
                      onTap: SignupPage(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

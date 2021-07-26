import 'package:cinema/components/rounded_button.dart';
import 'package:cinema/constants/color.dart';
import 'package:cinema/screens/welcome/background.dart';
import 'package:cinema/screens/welcome/login_screen.dart';
import 'package:cinema/screens/welcome/signup_screen.dart';
import 'package:cinema/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundedButton(
              text: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              color: LightPrimaryColor,
              text: Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * 0.1,
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

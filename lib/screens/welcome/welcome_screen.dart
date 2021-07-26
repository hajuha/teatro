import 'package:cinema/constants/color.dart';
import 'package:cinema/screens/welcome/background.dart';
import 'package:cinema/screens/welcome/login_signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size.height * 0.55,
              left: size.width * 0.1,
              child: Text(
                "Welcome !",
                style: TextStyle(
                  color: AccentColor,
                  fontFamily: 'Euclid',
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.55 + 48,
              left: size.width * 0.1,
              child: Container(
                width: size.width * 0.8,
                child: Text(
                  "Teatro app brings booking tickets for movies, and activities near you to your fingertips. \nBuy or rent movies of your choice.",
                  style: TextStyle(
                    color: AccentColor,
                    fontFamily: 'Euclid',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.1,
              child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: AccentColor,
                    onSurface: Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.brown,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return LoginSignupScreen();
                    }),
                  );
                },
                child: Text(
                  "Start !",
                  style: TextStyle(fontFamily: "Euclid", fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

import 'package:cinema/components/rounded_button.dart';
import 'package:cinema/components/rounded_input_field.dart';
import 'package:cinema/components/rounded_password_field.dart';
import 'package:cinema/constants/color.dart';
import 'package:cinema/model/signup_model.dart';
import 'package:cinema/screens/home_screen.dart';
import 'package:cinema/screens/welcome/background.dart';
import 'package:cinema/screens/welcome/login_screen.dart';
import 'package:cinema/screens/welcome/process.dart';
import 'package:cinema/service/api.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupRequestModel signupRequestModel;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    signupRequestModel = new SignupRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiBuild(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiBuild(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                signupRequestModel.email = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Username",
              onChanged: (value) {
                signupRequestModel.username = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                signupRequestModel.password = value;
              },
            ),
            RoundedButton(
              text: Text(
                "Signup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              press: () {
                setState(() {
                  isApiCallProcess = true;
                });
                APIService apiService = new APIService();
                apiService.signup(signupRequestModel).then(
                  (value) {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    final snackBar = SnackBar(
                      content: Text(
                          "Register successful! Check your email to verify. Redirecting..."),
                    );
                    scaffoldKey.currentState.showSnackBar(snackBar);
                    Future.delayed(Duration(seconds: 1)).then((_) {
                      // this code is executed after the future ends.
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    });
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an Account ? ",
                  style: TextStyle(color: AccentColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: AccentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
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

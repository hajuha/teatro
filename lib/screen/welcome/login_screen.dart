import 'package:cinema/components/rounded_button.dart';
import 'package:cinema/components/rounded_input_field.dart';
import 'package:cinema/components/rounded_password_field.dart';
import 'package:cinema/constants/color.dart';
import 'package:cinema/model/login_model.dart';
import 'package:cinema/screen/home_screen.dart';
import 'package:cinema/screen/welcome/background.dart';
import 'package:cinema/screen/welcome/process.dart';
import 'package:cinema/screen/welcome/signup_screen.dart';
import 'package:cinema/screen/welcome/welcome_screen.dart';
import 'package:cinema/service/api.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginRequestModel loginRequestModel;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
    loginRequestModel.username = "abcd";
    print(loginRequestModel.username);
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
                loginRequestModel.username = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                loginRequestModel.password = value;
              },
            ),
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
                setState(() {
                  isApiCallProcess = true;
                });
                print(loginRequestModel.toJson());

                APIService apiService = new APIService();
                apiService.login(loginRequestModel).then(
                  (value) {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    final snackBar =
                        SnackBar(content: Text("Login Successful"));
                    scaffoldKey.currentState.showSnackBar(snackBar);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don’t have an Account ? ",
                  style: TextStyle(color: AccentColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignupScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign up",
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

import 'package:cinema/model/login_model.dart';
import 'package:cinema/model/signup_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://894ab66d92fa.ap.ngrok.io/app-login";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 201 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<String> signup(SignupRequestModel requestModel) async {
    String url = "http://894ab66d92fa.ap.ngrok.io/register";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 201 || response.statusCode == 400) {
      return "success";
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

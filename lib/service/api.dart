import 'package:cinema/model/login_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://acf64e47f9c1.ap.ngrok.io/login";
    print(url);
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
}

class LoginResponseModel {
  final String accessToken;
  final String error;

  LoginResponseModel({this.accessToken, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json["data"]["access_token"] != null
          ? json["data"]["access_token"]
          : "",
      error: json["data"]["error"] != null ? json["data"]["error"] : "",
    );
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };

    return map;
  }
}

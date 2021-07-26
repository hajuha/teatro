class LoginResponseModel {
  final String username;
  final String avatarURL;
  final String fullName;
  final String email;
  final String error;

  LoginResponseModel(
      {this.username, this.avatarURL, this.fullName, this.email, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      email: json["data"]["email"] != null ? json["data"]["email"] : "",
      avatarURL:
          json["data"]["avatarURL"] != null ? json["data"]["avatarURL"] : "",
      fullName:
          json["data"]["fullName"] != null ? json["data"]["fullName"] : "",
      username:
          json["data"]["username"] != null ? json["data"]["username"] : "",
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

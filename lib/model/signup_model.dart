class SignupRequestModel {
  String username;
  String password;
  String email;

  SignupRequestModel({this.username, this.password, this.email});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
      'username': username.trim()
    };

    return map;
  }
}

class LoginResponseModel {
  String username;
  String email;
  String avatarURL;
  String fullName;

  LoginResponseModel(
      {this.username, this.email, this.avatarURL, this.fullName});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    avatarURL = json['avatarURL'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['avatarURL'] = this.avatarURL;
    data['fullName'] = this.fullName;
    return data;
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

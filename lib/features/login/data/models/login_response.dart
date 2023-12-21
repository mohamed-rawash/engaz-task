class LoginResponse {
  String? usersID;
  String? userName;
  String? userPhone;
  String? password;
  String? email;
  String? userToken;
  String? userFirebaseToken;

  LoginResponse({
    this.usersID,
    this.userName,
    this.userPhone,
    this.password,
    this.email,
    this.userToken,
    this.userFirebaseToken,
  });

  factory LoginResponse.fromJson(json) {
    return LoginResponse(
      usersID: json['UsersID'],
      userName: json['UserName'],
      userPhone: json['UserName'],
      password: json['Password'],
      email: json['Email'],
      userToken: json['UserToken'],
      userFirebaseToken: json['UserFirebaseToken'],
    );
  }
}

class UserData {
  String username;
  String email;
  String mobile;
  String password;
  String passwordConfirmation;

  UserData({
    required this.username,
    required this.email,
    required this.mobile,
    required this.password,
    required this.passwordConfirmation,
  });


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'mobile': mobile,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}


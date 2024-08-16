class Login {
  final String email;
  final String userPassword;

  Login({
    required this.email,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'userPassword': userPassword,
    };
  }
}

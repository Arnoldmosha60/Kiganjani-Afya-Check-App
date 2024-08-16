class User {
  final String email;
  final String fullName;
  final String userPassword;

  User({
    required this.email,
    required this.fullName,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'userPassword': userPassword,
    };
  }
}

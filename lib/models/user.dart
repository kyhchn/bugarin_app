class User {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? token;
  final String? premium;

  User(
      {this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.premium,
      this.token});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        token = json['token'],
        premium = json['token'];
}

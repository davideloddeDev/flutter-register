class RegisterData {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const RegisterData({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }

  @override
  String toString() {
    return 'RegisterData(email: $email, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RegisterData &&
        other.email == email &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return Object.hash(email, password, firstName, lastName);
  }
}

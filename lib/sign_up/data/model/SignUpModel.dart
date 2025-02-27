class SignUpModel {
  final String firstName, lastName, username, email, phoneNumber, password;
  final DateTime dateBirth;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.dateBirth,
  });

  Map<String, dynamic> toJson() {
    return{
      "username": username,
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": "${dateBirth.year}-${dateBirth.month}-${dateBirth.day}",
      "password": password,
    };
  }
}

import '../../../core/client.dart';
import '../model/SignUpModel.dart';


class SignUpRepository{
  SignUpRepository({required this.client});

  final ApiClient client;
  String? jwt;
  Future<bool> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required DateTime dateBirth,
    required String password,
  }) async {
    final result = await client.signUp(
      SignUpModel(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        dateBirth: dateBirth,
      ),
    );
    return result;
  }
}

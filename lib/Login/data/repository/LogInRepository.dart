import 'package:categorylogin/sign_up/data/model/SignUpModel.dart';

import '../../../core/client.dart';
import '../../../core/secure_storsge.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;
  String? jwt;

  Future<void> login(String login, String password) async {
    final String? token = await client.login(login, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.saveToken(token!);
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }


  Future<bool> retryLogin() async {
    final credentials = await SecureStorage.getCredentials();

    if (credentials == null) return false;

    final String? newToken =
        await client.login(credentials['login']!, credentials['password']!);

    if (newToken != null) {
      await SecureStorage.saveToken(newToken);
      return true;
    }
    return false;
  }

  signUp({required String firstName, required String lastName, required String username, required String email, required String phoneNumber, required DateTime dateBirth, required String password}) {}
}

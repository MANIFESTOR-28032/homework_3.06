import 'dart:io';
import 'package:categorylogin/core/client.dart';

class ProfileRepository {
  ProfileRepository({required this.client});
  final ApiClient client;

  // ✅ **Profil rasmini yuklash**
  Future<bool> uploadProfilePhoto(File file, int userId) async {
    print("📤 Rasm yuklanmoqda... User ID: $userId");
    final result = await client.uploadProfilePhoto(file);
    print(result ? "✅ Yuklandi!" : "❌ Yuklanmadi!");
    return result;
  }
}

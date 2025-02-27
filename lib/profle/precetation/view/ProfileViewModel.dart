import 'dart:io';
import 'package:categorylogin/profle/data/repository/ProfileRepository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({required ProfileRepository authRepo}) : _authRepo = authRepo;
  final ProfileRepository _authRepo;

  final bioController = TextEditingController();
  File? profilePhoto;
  String? _gender;
  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
    notifyListeners();
  }

  // 📸 **Galereyadan rasm tanlash funksiyasi**
  Future<void> pickProfilePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      profilePhoto = File(photo.path);
      notifyListeners();
    }
  }

  // ✅ **Profilni to‘ldirish (User ID olish + Rasm yuklash)**
  Future<bool> completeProfile() async {
    int? userId = await getUserId(); // 🔹 **User ID olish**
    if (userId == null) {
      print("❌ Xatolik: User ID topilmadi!");
      return false;
    }
    print("✅ User ID: $userId");

    if (profilePhoto != null) {
      return await _authRepo.uploadProfilePhoto(profilePhoto!, userId);
    }
    return true;
  }

  // 🔹 **SharedPreferences dan User ID olish**
  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("12");
    print("🔍 Olingan User ID: $userId");
    return userId;
  }
}

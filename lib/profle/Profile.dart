import 'package:categorylogin/core/client.dart';
import 'package:categorylogin/profle/data/repository/ProfileRepository.dart';
import 'package:categorylogin/profle/precetation/view/ProfileViewModel.dart';
import 'package:categorylogin/profle/precetation/widget/ProfileImagePicker.dart';
import 'package:categorylogin/profle/precetation/widget/profile_gender.dart';
import 'package:categorylogin/profle/profile_bio.dart';
import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(
        vm: ProfileViewModel(
          authRepo: ProfileRepository(
            client: ApiClient(),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.vm});

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.bacround,
        appBar: AppBar(
          backgroundColor: AppColors.bacround,
          toolbarHeight: 60,
          title: Center(
            child: Text(
              "Profile",
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
          children: [
            Text(
              "Complete your profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Lorem ipsum dolor sit amet pretium cras id dui\n"
              "pellentesque ornare. Quisque malesuada netus\n"
              "pulvinar diam.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 44,
            ),
            ProfileImagePicker(
              vm: vm,
            ),
            SizedBox(height: 30),
            Text(
              "Gender",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 14),
            ProfileGender(vm: vm),
            SizedBox(height: 14),
            Text(
              "Bio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 14),
            ProfileBio(
              vm: vm,
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () async {
                vm.completeProfile();
              },
              child: Container(
                width: 204,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.redpinkmain,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

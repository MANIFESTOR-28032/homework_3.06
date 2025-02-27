import 'package:categorylogin/profle/precetation/view/ProfileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key, required this.vm});

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.pink,
            radius: 50,
            child: ClipOval(
              child: vm.profilePhoto == null
                  ? SvgPicture.asset(
                "assets/person.svg",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
                  : Image.file(
                vm.profilePhoto!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () async {
                await vm.pickProfilePhoto();
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

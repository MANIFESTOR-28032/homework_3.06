import 'package:categorylogin/profle/precetation/view/ProfileViewModel.dart';
import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({
    super.key, required this.vm,
  });
  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      minLines: 5,
      controller: vm.bioController,
      style: TextStyle(
        height: 1,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 25, top: 20),
          hintText: "About Yourself",
          hintStyle: TextStyle(
            color: AppColors.bacround.withValues(alpha: 0.5),
          ),
          filled: true,
          fillColor: AppColors.redpink,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          )),
    );
  }
}

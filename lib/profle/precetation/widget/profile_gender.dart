import 'package:categorylogin/profle/precetation/view/ProfileViewModel.dart';
import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

class ProfileGender extends StatelessWidget {
  const ProfileGender({
    super.key,
    required this.vm,
  });

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<String?>(
          context: context,
          builder: (context) => Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.redpink,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop('Male');
                  },
                  child: Text(
                    "Male",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop('Female');
                  },
                  child: Text(
                    "Female",
                  ),
                ),
              ],
            ),
          ),
        );
        vm.gender = result;
      },
      child: SizedBox(
        width: 358,
        height: 40,
        child: Container(
          width: double.infinity,
          height: 41,
          decoration: BoxDecoration(
            color: AppColors.redpink,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 25, top: 10),
            child: Text(
              vm.gender == null ? "Male/Female" : vm.gender!,
              style: TextStyle(
                color: AppColors.bacround
                    .withValues(alpha: vm.gender == null ? 0.5 : 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

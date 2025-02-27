import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils.dart';

class SignUpViewModelSimpleDialog extends StatelessWidget {
  const SignUpViewModelSimpleDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: SizedBox(
        width: 250,
        height: 286,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 9),
            Container(
              width: 82,
              height: 82,
              decoration: BoxDecoration(
                color: AppColors.redpink,
                borderRadius: BorderRadius.circular(41),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "asset/person.svg",
                  width: 30,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 9),
            Text(
              "Lorem ipsum dolor sit\namet pretium cras id dui\npellentesque ornare.\nQuisque malesuada.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

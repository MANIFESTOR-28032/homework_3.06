import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({
    super.key,
    required this.title,
    required this.hintText,
    required this.validator,
    required this.controller,
  });

  final String title, hintText;
  final String? Function(String? value) validator;
  final TextEditingController controller;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 375,
          child: TextFormField(
            onTapOutside: (event) => focusNode.unfocus(),
            focusNode: focusNode,
            controller: controller,
            validator: validator,
            style: TextStyle(
              color: AppColors.bacround,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.pink,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.bacround.withValues(alpha: 0.5),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 36),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18),
              )
            ),
          ),
        )
      ],
    );
  }
}

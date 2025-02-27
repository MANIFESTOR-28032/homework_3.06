import 'package:categorylogin/utils.dart';
import 'package:flutter/material.dart';

class CategoryPageSizedBox extends StatelessWidget {
  const CategoryPageSizedBox({
    super.key, required this.hintText, required this.validator, required this.controller,
  });

  final String hintText;
  final String? Function(String? value) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Email',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: 357,
          height: 41,
          child: TextFormField(
            controller: controller,
            validator: validator,
            style: TextStyle(color: AppColors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.pink,
              hintText: "example@gmail.com ",
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.black.withValues(alpha: 0.45),
                  fontWeight: FontWeight.w500),
              contentPadding: EdgeInsets.symmetric(horizontal: 36),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

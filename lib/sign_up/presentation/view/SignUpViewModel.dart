import 'package:categorylogin/sign_up/data/repository/SignUpRepository.dart';
import 'package:categorylogin/sign_up/presentation/widget/sign_up_view_model_simple_dialog.dart';
import 'package:flutter/material.dart';

import '../../../Login/data/repository/LogInRepository.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required SignUpRepository authRepo}) : _authRepo = authRepo;

  final  SignUpRepository _authRepo;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  DateTime? _selectedData;

  DateTime? get selectedData => _selectedData;

  set selectedData(DateTime? value) {
    _selectedData = value ?? _selectedData;
    notifyListeners();
  }

  Future signUp(BuildContext context) async {
    if (selectedData == null) {
      print("⚠️ Tug‘ilgan sana kiritilmagan!");
      return;
    }

    final result = await _authRepo.signUp(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      username: userNameController.text,
      email: emailController.text,
      phoneNumber: numberController.text,
      dateBirth: selectedData!,
      password: passwordController.text,
    );

    if (formKey.currentState!.validate()) {
      if (result && context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => SignUpViewModelSimpleDialog(),
        );
        await Future.delayed(Duration(seconds: 4));
      }
    }
  }
}

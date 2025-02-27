import 'package:categorylogin/Login/presentation/pages/view/login_view_model.dart';
import 'package:flutter/material.dart';

import '../Categories/ui_model.dart';
import '../sign_up/presentation/SignUpPage.dart';
import '../utils.dart';
import 'presentation/pages/widget/LogInPassword.dart';
import 'presentation/pages/widget/LogInEmail.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
    required this.vm,
  });

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.bacround,
        appBar: AppBar(
          backgroundColor: AppColors.bacround,
          title: Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: AppColors.redpinkmain,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              Form(
                key: vm.formKey,
                child: CategoryPageSizedBox(
                  hintText: "example@gmail.com",
                  validator: (value) => null,
                  controller: vm.loginController,
                ),
              ),
              CategoryPageColumn(controller: vm.passwordController),
              SizedBox(height: 90),
              if (vm.hasError)
                Text(
                  vm.errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              Column(
                children: [
                  Column(
                    children: [
                      if (vm.hasError)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      SizedBox(
                        width: 207,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (vm.formKey.currentState!.validate()) {
                              bool isSuccess = await vm.login();

                              if (isSuccess && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Muvaffaqiyatli login qilindi!"),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Categories()),
                                );
                              } else {
                                vm.setError("Login yoki parol noto‘g‘ri!");
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redpink,
                          ),
                          child: Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: AppColors.pink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 207,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redpink,
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.pink,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:dowith/screen/login/util/IDTextField.dart';
import 'package:dowith/screen/login/util/PasswordTextField.dart';
import 'package:dowith/screen/login/widgets/LoginButton.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController idController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  LoginForm({required this.idController, required this.passwordController, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IDTextField(idController: idController),
        SizedBox(height: 10),
        PasswordTextField(passwordController: passwordController),
        SizedBox(height: 40),
        LoginButton(onLogin: onLogin),
      ],
    );
  }
}

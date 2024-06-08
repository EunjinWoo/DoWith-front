import 'package:dowith/screen/login/util/IDTextField.dart';
import 'package:dowith/screen/login/util/PasswordTextField.dart';
import 'package:dowith/screen/signup/util/EmailTextField.dart';
import 'package:dowith/screen/signup/util/NameTextField.dart';
import 'package:dowith/screen/signup/util/PasswordCheckTextField.dart';
import 'package:dowith/screen/signup/widgets/SignupButton.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController idController;
  final TextEditingController passwordController;
  final TextEditingController passwordcheckController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final VoidCallback onSignup;

  SignupForm({
    required this.idController,
    required this.passwordController,
    required this.passwordcheckController,
    required this.nameController,
    required this.emailController,
    required this.onSignup
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IDTextField(idController: idController),
        SizedBox(height: 10),
        PasswordTextField(passwordController: passwordController),
        SizedBox(height: 10),
        PasswordCheckTextField(passwordcheckController: passwordcheckController, passwordController: passwordController),
        SizedBox(height: 10),
        NameTextField(nameController: nameController),
        SizedBox(height: 10),
        EmailTextField(emailController: emailController),
        SizedBox(height: 40),
        SignupButton(onSignup: onSignup),
      ],
    );
  }
}

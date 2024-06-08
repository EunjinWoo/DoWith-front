import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onLogin;

  LoginButton({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLogin,
      child: Image.asset('assets/img/loginpg_btn.png', height: 35),
    );
  }
}
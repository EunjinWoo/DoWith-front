import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final VoidCallback onSignup;

  SignupButton({required this.onSignup});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignup,
      child: Image.asset('assets/img/signuppg_btn.png', height: 35),
    );
  }
}
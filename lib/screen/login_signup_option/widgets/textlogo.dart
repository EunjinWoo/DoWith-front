import 'package:flutter/material.dart';

class textlogo extends StatelessWidget {
  const textlogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/logo.png',
      fit: BoxFit.contain,
      height: 32,
    );
  }
}
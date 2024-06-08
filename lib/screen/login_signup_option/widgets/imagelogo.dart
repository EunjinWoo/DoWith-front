import 'package:flutter/material.dart';

class imagelogo extends StatelessWidget {
  const imagelogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(
        'assets/img/circleimg_Orange.png',
        fit: BoxFit.contain,
        height: 120,
      ),
    );
  }
}
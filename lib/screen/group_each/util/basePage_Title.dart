import 'package:flutter/material.dart';

class basePage_Title extends StatelessWidget {
  final String title;
  const basePage_Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container( // title
      height: 120,
      width: double.infinity, // 화면 가로 전체
      alignment: Alignment.topCenter,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arimo-Bold',
            color: Colors.black,
            fontSize: 150,
          ),
        ),
      ),
    );
  }
}
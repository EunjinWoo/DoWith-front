import 'package:flutter/material.dart';

class basePage_GroupIntro extends StatelessWidget {
  final String groupIntro;
  const basePage_GroupIntro({super.key, required this.groupIntro});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 15, bottom: 15),
      width: 300,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          groupIntro,
          style: TextStyle(fontSize: 28,fontFamily: 'Arimo-Regular', color: Colors.white),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
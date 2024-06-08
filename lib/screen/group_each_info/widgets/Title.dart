import 'package:flutter/material.dart';

class eachGroupinfoPage_Title extends StatelessWidget {
  final String title;
  const eachGroupinfoPage_Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      constraints: BoxConstraints(
        maxHeight: 130,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Arimo-Bold',
            color: Colors.black,
            fontSize: 250,
            height: 1,
          ),
        ),
      ),
    );
  }
}
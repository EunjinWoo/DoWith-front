import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 120, right: 120, bottom: 70, top: 30),
      child: Image.asset('assets/img/logo_fullword.png'),
    );
  }
}
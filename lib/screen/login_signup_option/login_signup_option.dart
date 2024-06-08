import 'package:dowith/screen/login/login.dart';
import 'package:dowith/screen/login_signup_option/widgets/imagelogo.dart';
import 'package:dowith/screen/login_signup_option/widgets/signuppagebtns.dart';
import 'package:dowith/screen/login_signup_option/widgets/textlogo.dart';
import 'package:dowith/screen/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signinpage extends StatelessWidget {
  const signinpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: signinpage_all(),
            ),
          ],
        ),
      ),
    );
  }
}

class signinpage_all extends StatelessWidget {
  const signinpage_all({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 70),
            child: Column(
              children: [
                textlogo(),
                imagelogo(),
                // Image.asset('assets/img/_.gif'),
                select_signuppagebtns(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

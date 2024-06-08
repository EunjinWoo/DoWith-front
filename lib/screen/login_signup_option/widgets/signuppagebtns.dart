import 'package:dowith/screen/login/login.dart';
import 'package:dowith/screen/signup/signup.dart';
import 'package:flutter/material.dart';

class select_signuppagebtns extends StatelessWidget {
  const select_signuppagebtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 130),
      child: Column(
        children: [
          _loginbtn(),
          SizedBox(height: 10,),
          _signupbtn(),
        ],
      ),
    );
  }
}

class _loginbtn extends StatelessWidget {
  const _loginbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Image.asset(
        'assets/img/select_loginbtn.png',
        fit: BoxFit.contain,
        height: 70,
      ),
    );
  }
}

class _signupbtn extends StatelessWidget {
  const _signupbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignupPage()),
        );
      },
      child: Image.asset(
        'assets/img/select_signupbtn.png',
        fit: BoxFit.contain,
        height: 70,
      ),
    );
  }
}
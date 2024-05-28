import 'package:dowith/screen/login/login.dart';
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

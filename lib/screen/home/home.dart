import 'package:dowith/screen/group_each/group_each.dart';
import 'package:dowith/screen/home/widgets/GroupList.dart';
import 'package:dowith/screen/login_signup_option/login_signup_option.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signinpage(),
    );
  }
}

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: _mainpage_title(),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.3),
          child: Divider(
            color: Colors.black,
            thickness: 0.3,
          ),
        ),
      ),
      body: GroupList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action on button press
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }
}

class _mainpage_title extends StatelessWidget {
  const _mainpage_title({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Image.asset(
            'assets/img/logo.png',
            fit: BoxFit.contain,
            height: 22,
          ),
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/img/profile_pic.jpeg'),
        ),
      ],
    );
  }
}

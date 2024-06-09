import 'dart:convert';

import 'package:dowith/screen/login/login.dart';
import 'package:dowith/screen/signup/widgets/Logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup_form.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordcheckController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _signup() async {
    final String account = _idController.text;
    final String password = _passwordController.text;
    final String passwordcheck = _passwordcheckController.text;
    final String name = _nameController.text;
    final String email = _emailController.text;

    print('Username: ${_idController.text}');
    print('Password: ${_passwordController.text}');
    print('passwordcheck: ${_passwordcheckController.text}');
    print('name: ${_nameController.text}');
    print('email: ${_emailController.text}');

    final Map<String, dynamic> data = {
      'account': account,
      'password': password,
      'name': name,
      'email': email,
    };

    final String jsonString = json.encode(data);

    final http.Response response = await http.post(
      Uri.parse('http://127.0.0.1:80/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonString,
    );

    if (response.statusCode == 200) {
      print('Login successful: ${response.body}');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    } else {
      print('Failed to login: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  void initState() {
    super.initState();
    _idController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    _passwordcheckController.addListener(() => setState(() {}));
    _nameController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _passwordcheckController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // color: Colors.blue,
        padding: EdgeInsets.all(16.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.white,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Logo(),
              SignupForm(
                idController: _idController,
                passwordController: _passwordController,
                passwordcheckController: _passwordcheckController,
                nameController: _nameController,
                emailController: _emailController,
                onSignup: _signup,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

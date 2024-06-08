import 'dart:convert';
import 'package:dowith/screen/home/home.dart';
import 'package:dowith/screen/login/widgets/Logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_form.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final String account = _idController.text;
    final String password = _passwordController.text;

    final Map<String, dynamic> data = {
      'account': account,
      'password': password,
    };

    final String jsonString = json.encode(data);

    final http.Response response = await http.post(
      Uri.parse('http://127.0.0.1:80/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonString,
    );

    print('Username: ${account}');
    print('Password: ${password}');

    if (response.statusCode == 200) {
      print('Login successful: ${response.body}');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return mainpage();
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
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
              LoginForm(
                idController: _idController,
                passwordController: _passwordController,
                onLogin: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
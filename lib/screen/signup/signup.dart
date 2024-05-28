import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup_form.dart';

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

  void _signup() {
    print('Username: ${_idController.text}');
    print('Password: ${_passwordController.text}');
    print('passwordcheck: ${_passwordcheckController.text}');
    print('name: ${_nameController.text}');
    print('email: ${_emailController.text}');
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

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 120, right: 120, bottom: 70, top: 30),
      child: Image.asset('assets/img/logo_fullword.png'),
    );
  }
}
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController idController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  LoginForm({required this.idController, required this.passwordController, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IDTextField(idController: idController),
        SizedBox(height: 10),
        PasswordTextField(passwordController: passwordController),
        SizedBox(height: 40),
        LoginButton(onLogin: onLogin),
      ],
    );
  }
}

class IDTextField extends StatelessWidget {
  final TextEditingController idController;

  IDTextField({required this.idController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: idController,
      decoration: InputDecoration(
        labelText: 'id',
        labelStyle: TextStyle(color: Colors.white, fontSize: 28, fontFamily: 'Arimo-Regular'),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        filled: true,
        fillColor: Colors.black,
      ),
      style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Arimo-Medium'),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;

  PasswordTextField({required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'pw',
        labelStyle: TextStyle(color: Colors.white, fontSize: 28, fontFamily: 'Arimo-Regular'),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        filled: true,
        fillColor: Colors.black,
      ),
      obscureText: true,
      style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Arimo-Medium'),
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback onLogin;

  LoginButton({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLogin,
      child: Image.asset('assets/img/loginpg_btn.png', height: 35),
    );
  }
}

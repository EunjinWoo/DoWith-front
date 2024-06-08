import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;

  PasswordTextField({required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'password',
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
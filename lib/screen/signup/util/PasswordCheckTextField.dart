import 'package:flutter/material.dart';

class PasswordCheckTextField extends StatelessWidget {
  final TextEditingController passwordcheckController;
  final TextEditingController passwordController;

  PasswordCheckTextField({required this.passwordcheckController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordcheckController,
      decoration: InputDecoration(
        labelText: 'password check',
        labelStyle: TextStyle(color: Colors.white, fontSize: 28, fontFamily: 'Arimo-Regular'),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        filled: true,
        fillColor: Colors.black,
        suffixIcon: Icon(
          Icons.circle,
          color:
          ((passwordcheckController.text == passwordController.text) && passwordcheckController.text != '')
              ? Color(0xFF000AFF)
              : Color(0xFFFF3D00),
          size: 33.5,
        ),
      ),
      obscureText: true,
      style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Arimo-Medium'),
    );
  }
}
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;

  EmailTextField({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'email',
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
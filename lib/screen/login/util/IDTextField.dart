import 'package:flutter/material.dart';

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
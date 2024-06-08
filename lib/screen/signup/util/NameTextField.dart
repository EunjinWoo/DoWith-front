import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController nameController;

  NameTextField({required this.nameController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'name',
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
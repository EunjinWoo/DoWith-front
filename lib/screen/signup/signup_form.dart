import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController idController;
  final TextEditingController passwordController;
  final TextEditingController passwordcheckController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final VoidCallback onSignup;

  SignupForm({
    required this.idController,
    required this.passwordController,
    required this.passwordcheckController,
    required this.nameController,
    required this.emailController,
    required this.onSignup
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IDTextField(idController: idController),
        SizedBox(height: 10),
        PasswordTextField(passwordController: passwordController),
        SizedBox(height: 10),
        PasswordCheckTextField(passwordcheckController: passwordcheckController, passwordController: passwordController),
        SizedBox(height: 10),
        NameTextField(nameController: nameController),
        SizedBox(height: 10),
        EmailTextField(emailController: emailController),
        SizedBox(height: 40),
        SignupButton(onSignup: onSignup),
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

class SignupButton extends StatelessWidget {
  final VoidCallback onSignup;

  SignupButton({required this.onSignup});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignup,
      child: Image.asset('assets/img/signuppg_btn.png', height: 35),
    );
  }
}
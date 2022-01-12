import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/radius_button.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:crypto/crypto.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Inscription", style: TextStyle(fontSize: 25)),
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: nameController,
              validator: (value) { return value!.validateName();},
              decoration: const InputDecoration(
                  labelText: "Prénom", icon: Icon(Icons.assignment_ind)),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: firstNameController,
              validator: (value) { return value!.validateLastName();},
              decoration: const InputDecoration(
                  labelText: "Nom", icon: Icon(Icons.assignment_ind)),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: mailController,
              validator: (value) { return value!.validateEmail();},
              decoration:
                  const InputDecoration(labelText: "Email", icon: Icon(Icons.mail)),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child:  TextFormField(
              controller: phoneController,
              validator: (value) { return value!.validatePhone();},
              decoration: const InputDecoration(
                  labelText: "Téléphone", icon: Icon(Icons.phone)),
            ),
          ),
          const SizedBox(height: 50),
          RadiusButton("S'inscrire", () {
            if (_formKey.currentState!.validate()) {
              var user = userService.postUser(sha512.convert(utf8.encode("test")).toString().toUpperCase(), nameController.text, firstNameController.text, phoneController.text, mailController.text);
              if(user is User) {
                
              }
            }
          }),
        ],
      ),
    ));
  }
}

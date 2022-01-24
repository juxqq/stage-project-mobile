import 'dart:convert';
import 'package:flutter/material.dart';
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
  String dropdownValue = 'M';

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
        body: SafeArea(
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Inscription", style: TextStyle(fontSize: 25)),
                      const SizedBox(height: 25),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 60,
                        ),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            return value!.validateName();
                          },
                          decoration: InputDecoration(
                              labelText: "Prénom",
                              icon: Icon(Icons.assignment_ind)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 60,
                        ),
                        child: TextFormField(
                          controller: firstNameController,
                          validator: (value) {
                            return value!.validateLastName();
                          },
                          decoration: InputDecoration(
                              labelText: "Nom",
                              icon: Icon(Icons.assignment_ind)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(
                            left: 40,
                            right: 60,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.assignment_ind, color: Colors.grey),
                              const SizedBox(width: 20),
                              _buildDropButton()
                            ],
                          )),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 60,
                        ),
                        child: TextFormField(
                          controller: mailController,
                          validator: (value) {
                            return value!.validateEmail();
                          },
                          decoration: InputDecoration(
                              labelText: "Email", icon: Icon(Icons.mail)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 60,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) => value!.validatePassword(),
                          decoration: InputDecoration(
                              labelText: "Mot de passe",
                              icon: Icon(Icons.lock)),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          left: 40,
                          right: 60,
                        ),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            return value!.validatePhone();
                          },
                          decoration: const InputDecoration(
                              labelText: "Téléphone", icon: Icon(Icons.phone)),
                        ),
                      ),
                      const SizedBox(height: 50),
                      RadiusButton("S'inscrire", () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Inscription en cours...')),
                          );
                          await userService
                              .createUser(
                                  sha512
                                      .convert(
                                          utf8.encode(passwordController.text))
                                      .toString(),
                                  nameController.text,
                                  firstNameController.text,
                                  phoneController.text,
                                  mailController.text)
                              .then((value) {
                            if (value == true) {
                              Navigator.pushNamed(context, '/main');
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Inscription réussie ! Confirmer votre adresse mail.'),
                                      backgroundColor: Colors.green));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Inscription impossible ! Un compte utilise déjà cet adresse mail."),
                                      backgroundColor: Colors.red));
                            }
                          });
                        }
                      }, Colors.lightBlue),
                    ],
                  ),
                ))));
  }

  Widget _buildDropButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items:
          <String>['M', 'F', 'A'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

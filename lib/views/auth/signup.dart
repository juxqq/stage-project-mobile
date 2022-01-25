import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/dropdown_list.dart';
import 'package:mobile_app/share/radius_button.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:mobile_app/share/text_form.dart';
import 'package:crypto/crypto.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late Widget signupWidget;
  late Widget buttonWidget;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    signupWidget = initialSignup;
    buttonWidget = initialButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                        child: Stack(children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Image.asset('assets/img/creatingprofile.png',
                                height: 400),
                          )
                        ]),
                      ),
                      const Text("Inscription", style: TextStyle(fontSize: 25)),
                      const SizedBox(height: 25),
                      AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: signupWidget,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                      ),
                      const SizedBox(height: 25),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: buttonWidget,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                      ),
                    ],
                  ),
                )))));
  }

  late Widget initialButton = RadiusButton("Suivant", () {
    setState(() {
      signupWidget = finalSignup;
      buttonWidget = finalButton;
    });
  }, Colors.black);

  late Widget finalButton = Row(
    children: [
      RadiusButton('Retour', () {
        setState(() {
          buttonWidget = initialButton;
          signupWidget = initialSignup;
        });
      }, Colors.black),
      RadiusButton("S'inscrire", () async {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Inscription en cours...')),
          );
          await userService
              .createUser(
                  sha512
                      .convert(utf8.encode(passwordController.text))
                      .toString(),
                  nameController.text,
                  firstNameController.text,
                  phoneController.text,
                  mailController.text)
              .then((value) {
            if (value == true) {
              Navigator.pushNamed(context, '/main');
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'Inscription réussie ! Confirmer votre adresse mail.'),
                  backgroundColor: Colors.green));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Inscription impossible ! Un compte utilise déjà cet adresse mail."),
                  backgroundColor: Colors.red));
            }
          });
        }
      }, Colors.black)
    ],
  );

  late Widget initialSignup = Column(children: [
    TextForm(nameController, 'Prénom', (value) => value!.validateName(),
        Icons.assignment_ind, false, () {}, TextInputType.text),
    const SizedBox(height: 20),
    TextForm(firstNameController, 'Nom', (p0) => p0!.validateLastName(),
        Icons.assignment, false, () {}, TextInputType.text),
    const SizedBox(height: 20),
    AppTextField(
      textEditingController: genreController,
      isCitySelected: true,
      cities: [
        SelectedListItem(false, 'Homme'),
        SelectedListItem(false, 'Femme'),
        SelectedListItem(false, 'Autre'),
      ],
    )
  ]);

  late Widget finalSignup = Column(children: [
    TextForm(mailController, 'E-mail', (p0) => p0!.validateEmail(), Icons.mail,
        false, () {}, TextInputType.emailAddress),
    const SizedBox(height: 20),
    TextForm(passwordController, 'Mot de passe', (p0) => p0!.validatePassword(),
        Icons.lock, true, () {}, TextInputType.text),
    const SizedBox(height: 20),
    TextForm(
        phoneController,
        'Numéro de téléphone',
        (p0) => p0!.validatePhone(),
        Icons.phone,
        false,
        () {},
        TextInputType.phone)
  ]);
}

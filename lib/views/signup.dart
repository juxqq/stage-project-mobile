import 'package:flutter/material.dart';
import 'package:mobile_app/share/radius_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Veuillez entrer un email valide';
    else
      return null;
  }
  String? validatePhone(String? value) {
    String pattern =
        r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Veuillez entrer un numéro valide';
    else
      return null;
  }
  String? validateName(String? value){
    String pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Veuillez entrer un prénom valide';
    else
      return null;
  }
  String? validateLastName(String? value){
    String pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Veuillez entrer un nom valide';
    else
      return null;
  }

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
              validator: (value) => validateName(value),
              decoration: InputDecoration(
                  labelText: "Prénom", icon: Icon(Icons.assignment_ind)),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) => validateLastName(value),
              decoration: InputDecoration(
                  labelText: "Nom", icon: Icon(Icons.assignment_ind)),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) => validateEmail(value),
              decoration:
                  InputDecoration(labelText: "Email", icon: Icon(Icons.mail)),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child:  TextFormField(
              validator: (value) => validatePhone(value),
              decoration: const InputDecoration(
                  labelText: "Téléphone", icon: Icon(Icons.phone)),
            ),
          ),
          const SizedBox(height: 50),
          RadiusButton("S'inscrire", () {
            if (_formKey.currentState!.validate())
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Inscription en cours...')),
              );
          }),
        ],
      ),
    ));
  }
}

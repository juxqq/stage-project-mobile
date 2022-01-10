import 'package:flutter/material.dart';
import 'package:mobile_app/share/radius_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          const Text("Inscription", style: TextStyle(
            fontSize: 25
          )),
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                labelText: "Prénom"
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: "Nom"
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: "Email"
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: "Téléphone"
              ),
            ),
          ),
          const SizedBox(height: 50),
          RadiusButton("S'inscrire",
            onPressed: (){
              if (_formKey.currentState!.validate())
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Inscription en cours...')),
                );
              },
            },
          ),
        ],
      ),
    );
  }
}

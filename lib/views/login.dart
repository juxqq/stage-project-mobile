import 'package:flutter/material.dart';
import 'package:mobile_app/controller/user_controller.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/share/radius_button.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserController userController = UserController();

  @override 
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(key: _formKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bienvenue !", style: TextStyle(
            fontSize:25
          )),
          const SizedBox(height: 50),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: mailController,
                decoration: const InputDecoration(
                  labelText: "Nom d'utilisateur / email",
                  icon: Icon(Icons.mail)
                ),
                validator: (value) {
                  return value!.validateEmail();
                },
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: "Mot de passe",
              ),
              obscureText: true,
              validator: (value) {
                return value!.validatePassword();
              }
            )),
            const SizedBox(height: 50),
            RadiusButton("Se connecter", 
                               () { if(_formKey.currentState!.validate()) { 
                                 userController.connect(mailController.value.text, passwordController.value.text);
                               }}),
            const SizedBox(height:5),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.centerLeft,
              child : const Text("Vous n'avez pas de compte ?",
                                  style: TextStyle(fontSize: 14))),
            const SizedBox(height: 10),
            RadiusButton("S'inscrire", 
                                () { Navigator.pushNamed(context, "/signup"); })
        ],
      )
    ));
  }
}
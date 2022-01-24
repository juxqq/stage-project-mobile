import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/radius_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late int resetCode;
  User? user;
  bool? showCodeInput;
  String buttonText = "Envoyer le code";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Réinitialisation du mot de passe",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nom d'utilisateur / email",
                    icon: Icon(Icons.mail)),
                validator: (value) => value!.validateEmail(),
                controller: loginController,
              ),
            ),
            showCodeInput == true
                ? _buildCodeInput()
                : const SizedBox(height: 40),
            RadiusButton(buttonText, () {
              if (_formKey.currentState!.validate()) {
                if (showCodeInput == true) {
                  if (resetCode == int.parse(codeController.text)) {
                    UserService.updateUser(
                            user!.id,
                            passwordController.text.hashPass(),
                            user!.name,
                            user!.firstName,
                            user!.phone,
                            user!.mail)
                        .then((value) {
                      if (value == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Mot de passe modifier avec succès.'),
                              backgroundColor: Colors.green),
                        );
                        Navigator.pushNamed(context, '/main');
                      }
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Le code est incorrect'),
                        backgroundColor: Colors.red));
                  }
                } else {
                  UserService.resetPassword(loginController.text).then((value) {
                    if (value['code'].toString().isNotEmpty) {
                      setState(() {
                        resetCode = value['code'];
                        showCodeInput = true;
                        buttonText = "Valider le code";
                        user = User.fromJson(value);
                      });
                    }
                  });
                }
              }
            }, Colors.lightBlue)
          ],
        ),
      ),
    );
  }

  _buildCodeInput() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          TextFormField(
            controller: passwordController,
            validator: (value) => value!.validatePassword(),
            obscureText: true,
            decoration: const InputDecoration(
                labelText: "Nouveau mot de passe", icon: Icon(Icons.lock)),
          ),
          const SizedBox(height: 20),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: codeController,
              validator: (value) => value!.validateCode(),
              decoration: const InputDecoration(
                  labelText: "Code", icon: Icon(Icons.code))),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

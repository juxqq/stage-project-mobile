import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/radius_button.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:mobile_app/share/text_form.dart';

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
  String? _code;
  String buttonText = "Envoyer le code";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 250,
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset('assets/img/mail_validate.png',
                          height: 400),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("Réinitialisation du mot de passe",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 40),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 700),
                  child: _otherWidget,
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                ),
                const SizedBox(
                  height: 20,
                ),
                RadiusButton(buttonText, () {
                  if (_formKey.currentState!.validate()) {
                    if (showCodeInput == true) {
                      if (resetCode == int.parse(_code!)) {
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
                                  content: Text(
                                      'Mot de passe modifier avec succès.'),
                                  backgroundColor: Colors.green),
                            );
                            Navigator.pushNamed(context, '/main');
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Le code est incorrect'),
                                backgroundColor: Colors.red));
                      }
                    } else {
                      UserService.resetPassword(loginController.text)
                          .then((value) {
                        if (value['code'].toString().isNotEmpty) {
                          setState(() {
                            resetCode = value['code'];
                            showCodeInput = true;
                            buttonText = "Valider le code";
                            user = User.fromJson(value);
                            _otherWidget = _myWidget;
                          });
                        }
                      });
                    }
                  }
                }, Colors.black),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous n'avez pas reçu le code ?",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Renvoyez",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  late final Widget _myWidget = Column(children: [
    TextForm(
        passwordController,
        'Nouveau mot de passe',
        (value) => value!.validatePassword(),
        Icons.lock,
        true,
        () {},
        TextInputType.text),
    VerificationCode(
      textStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
      underlineColor: Colors.amber,
      keyboardType: TextInputType.number,
      length: 4,
      onCompleted: (String value) {
        setState(() {
          _code = value;
        });
      },
      onEditing: (bool value) {},
    )
  ]);

  late Widget _otherWidget = TextForm(
      loginController,
      'E-mail',
      (p0) => p0!.validateEmail(),
      Icons.mail,
      false,
      () {},
      TextInputType.emailAddress);
}

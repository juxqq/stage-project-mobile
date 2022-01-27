import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/controller/user_controller.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/share/text_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserController userController = UserController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                      child:
                          Image.asset('assets/img/fond-arbre.png', height: 400),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextForm(
                    mailController,
                    'E-mail',
                    (value) => value!.validateEmail(),
                    Icons.mail,
                    false,
                    () {},
                    TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                TextForm(
                    passwordController,
                    'Mot de passe',
                    (value) => value!.validatePassword(),
                    Icons.lock,
                    true,
                    () {},
                    TextInputType.text),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/reset");
                      },
                      child: const Text(
                        'Mot de passe oublié ?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      userController
                          .connect(mailController.value.text,
                              passwordController.value.text)
                          .then((value) {
                        if (value == true) {
                          Navigator.pushNamed(context, "/profile");
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                'Idenfiants incorrect ou compte non confirmer'),
                            backgroundColor: Colors.red,
                          ));
                        }
                      });
                    }
                  },
                  height: 45,
                  color: Colors.black,
                  child: const Text(
                    "Se connecter",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous n'avez pas de compte ?",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/signup");
                      },
                      child: const Text(
                        "S'enregistrer",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous êtes une association ?",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/signupAssoc");
                      },
                      child: const Text(
                        "S'inscrire",
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
}

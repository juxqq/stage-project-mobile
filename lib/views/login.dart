import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Bienvenue !", style: TextStyle(
            fontSize:25
          )),
          const SizedBox(height: 50),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "Nom d'utilisateur / email"
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: const TextField(
              decoration: InputDecoration(
                labelText: "Mot de passe"
              ),
            )),
            const SizedBox(height: 50),
            _buildRadiusButton("Se connecter", 
                               () { Navigator.pushNamed(context, "/main"); }),
            const SizedBox(height:5),
            Container(
              padding: const EdgeInsets.only(left: 40),
              alignment: Alignment.centerLeft,
              child : const Text("Vous n'avez pas de compte ?",
                                  style: TextStyle(fontSize: 14))),
            const SizedBox(height: 10),
            _buildRadiusButton("S'inscrire", 
                                () { Navigator.pushNamed(context, "/main"); })
        ],
      )
    );
  }

  Widget _buildRadiusButton(text, action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30),
      child: ElevatedButton(onPressed: action,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
          ),
        ),
        child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40)
          ),
          child: Center(
            child: Text(text,
                style: const TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/bottom_nav_bar.dart';
import 'package:mobile_app/share/radius_button.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late User user;

  @override void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    var data = await UserService.getUserId();
    user = User.fromJson(data);

    if(data != null) {
      nameController.text = data['name'];
      firstNameController.text = data['firstName'];
      mailController.text = data['mail'];
      phoneController.text = data['phone'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(key: _formKey, child: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Votre profil", style: TextStyle(fontSize: 40)),
          //A modifier avec la requère SQL adapté
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) => value!.validateLastName(),
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Nom"
              ),
            ),
          ),
          //A modifier avec la requère SQL adapté
          const SizedBox(height: 70,),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) => value!.validateName(),
              controller: firstNameController,
              decoration: const InputDecoration(
                  labelText: "Prenom"
              ),
            ),
          ),
          //A modifier avec la requère SQL adapté
          const SizedBox(height: 70,),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) => value!.validateEmail(),
              controller: mailController,
              decoration: const InputDecoration(
                  labelText: "Email"
              ),
            ),
          ),
          const SizedBox(height: 70,),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              validator: (value) => value!.validatePhone(),
              controller: phoneController,
              decoration: const InputDecoration(
                  labelText: "Télephone"
              ),
            ),
          ),
          const SizedBox(height: 20,),
          RadiusButton("Se déconnecter", ()  { UserService.removeToken();
                                               Navigator.pushNamed(context, "/main"); }),
          const SizedBox(height: 10),
          RadiusButton("Confirmer les modifications", () { if(_formKey.currentState!.validate()) {
            UserService.updateUser(user.id, user.password, nameController.text, firstNameController.text, phoneController.text, mailController.text).then((value) => {
              if(value == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Modification réussie !')),
                      )
              }
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Modifications impossible pour le moment.'), backgroundColor: Colors.red),
                      )
              }
            });
          }}),
        ],
      ))),
      bottomNavigationBar: const AppBarWidget()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/bottom_nav_bar.dart';
import 'package:mobile_app/share/radius_button.dart';
import 'package:mobile_app/share/text_form.dart';

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

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    var data = await UserService.getUserId();
    user = User.fromJson(data);

    if (data != null) {
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
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 180,
                ),
                const Text("Votre profil", style: TextStyle(fontSize: 40)),
                //A modifier avec la requère SQL adapté

                const SizedBox(
                  height: 50,
                ),
                TextForm(
                  nameController,
                  'Nom',
                  (value) => value!.validateName(),
                  Icons.person,
                  false,
                  () {},
                  TextInputType.name),
                //A modifier avec la requère SQL adapté
                const SizedBox(
                  height: 70,
                ),
                TextForm(
                    firstNameController,
                    'Prenom',
                    (value) => value!.validateName(),
                    Icons.person,
                    false,
                    () {},
                    TextInputType.name),
                //A modifier avec la requère SQL adapté
                const SizedBox(
                  height: 70,
                ),
                TextForm(
                    mailController,
                    'adresse email',
                    (value) => value!.validateEmail(),
                    Icons.alternate_email_sharp,
                    false,
                    () {},
                    TextInputType.emailAddress),
                const SizedBox(
                  height: 70,
                ),
                //Box pour le telephone
                TextForm(
                    phoneController,
                    'Telephone',
                    (value) => value!.validatePhone(),
                    Icons.add_call,
                    false,
                    () {},
                    TextInputType.phone),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(height: 10),
                RadiusButton("Confirmer les modifications", () {
                  if (_formKey.currentState!.validate()) {
                    UserService.updateUser(
                            user.id,
                            user.password,
                            nameController.text,
                            firstNameController.text,
                            phoneController.text,
                            mailController.text)
                        .then((value) => {
                              if (value == true)
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Modification réussie !'),
                                        backgroundColor: Colors.green),

                                  )
                                }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Modifications impossible pour le moment.'),
                                        backgroundColor: Colors.red),
                                  )
                                }
                            });
                  }
                }, Colors.black),
                const SizedBox(
                  height: 20,
                ),
                RadiusButton("Se déconnecter", () {
                  // Navigator.pushNamed(context, "/reset");
                  UserService.removeToken();
                  Navigator.pushNamed(context, "/main");
                }, Colors.red),
                RadiusButton("test", () {
                  // Navigator.pushNamed(context, "/reset");
                  Navigator.pushNamed(context, "/settings");
                }, Colors.white),
              ],
            ))),
        bottomNavigationBar: const AppBarWidget());
  }
}

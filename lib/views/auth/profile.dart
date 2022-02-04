import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

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
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Votre profil",
                                    style: TextStyle(fontSize: 40)),

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
                                    UserService.updateUser(user.id, {
                                      "name": nameController.text,
                                      "firstName": firstNameController.text,
                                      "phone": phoneController.text,
                                      "mail": mailController.text,
                                      "password": user.password
                                    }).then((value) => {
                                          if (value == true)
                                            {
                                              showSnackBar(
                                                  context,
                                                  'Modification réussie !',
                                                  Colors.green)
                                            }
                                          else
                                            {
                                              showSnackBar(
                                                  context,
                                                  'Modifications impossible pour le moment.',
                                                  Colors.red)
                                            }
                                        });
                                  }
                                }, Colors.black),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            )))))),
        bottomNavigationBar: const AppBarWidget());
  }
}

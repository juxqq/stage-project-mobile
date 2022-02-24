import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/controller/user_controller.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/dropdown_list.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';
import 'package:path/path.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late Widget signupWidget;
  late Widget buttonWidget;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    signupWidget = initialSignup;
    buttonWidget = initialButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 250,
                          child: CircleAvatar(
                              radius: 90,
                              backgroundImage: _image == null
                                  ? Image.asset(
                                          'assets/img/creatingprofile.png')
                                      .image
                                  : Image.file(_image!).image)),
                      const Text("Inscription", style: TextStyle(fontSize: 25)),
                      const SizedBox(height: 25),
                      AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: signupWidget,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                      ),
                      const SizedBox(height: 25),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: buttonWidget,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                      ),
                    ],
                  ),
                )))));
  }

  late Widget initialButton = RadiusButton("Suivant", () {
    if (_formKey.currentState!.validate()) {
      setState(() {
        signupWidget = finalSignup;
        buttonWidget = finalButton;
      });
    }
  }, Colors.black);

  late Widget finalButton = Row(
    children: [
      RadiusButton('Retour', () {
        setState(() {
          buttonWidget = initialButton;
          signupWidget = initialSignup;
        });
      }, Colors.black),
      RadiusButton("S'inscrire", () async {
        if (_formKey.currentState!.validate()) {
          showSnackBar(context, 'Inscription en cours...', Colors.grey);
          UserController.register(
              passwordController.text,
              nameController.text,
              firstNameController.text,
              phoneController.text,
              mailController.text,
              context,
              basename(_image!.path));
        }
      }, Colors.black)
    ],
  );

  late Widget initialSignup = Column(children: [
    TextForm(nameController, 'Prénom', (value) => value!.validateName(),
        Icons.assignment_ind, false, () {}, TextInputType.text),
    const SizedBox(height: 20),
    TextForm(firstNameController, 'Nom', (p0) => p0!.validateLastName(),
        Icons.assignment, false, () {}, TextInputType.text),
    const SizedBox(height: 20),
    AppTextField(
        textEditingController: genreController,
        isCitySelected: true,
        cities: [
          SelectedListItem(false, 'Homme'),
          SelectedListItem(false, 'Femme'),
          SelectedListItem(false, 'Autre'),
        ],
        text: 'Genre')
  ]);

  late Widget finalSignup = Column(children: [
    TextForm(mailController, 'E-mail', (p0) => p0!.validateEmail(), Icons.mail,
        false, () {}, TextInputType.emailAddress),
    const SizedBox(height: 20),
    TextForm(passwordController, 'Mot de passe', (p0) => p0!.validatePassword(),
        Icons.lock, true, () {}, TextInputType.text),
    const SizedBox(height: 20),
    TextForm(
        phoneController,
        'Numéro de téléphone',
        (p0) => p0!.validatePhone(),
        Icons.phone,
        false,
        () {},
        TextInputType.phone),
    RadiusButton('Choisir dans la galerie', () async {
      final image = await _picker.getImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final imageTemporary = File(image.path);
      setState(() {
        _image = imageTemporary;
      });
      upload(_image!, "users");
    }, Colors.black)
  ]);
}

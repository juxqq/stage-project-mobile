import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/services/assoc_service.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/dropdown_list.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

class SignUpAssoc extends StatefulWidget {
  const SignUpAssoc({Key? key}) : super(key: key);

  @override
  _SignUpAssocState createState() => _SignUpAssocState();
}

class _SignUpAssocState extends State<SignUpAssoc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController siretController = TextEditingController();
  final TextEditingController presidentController = TextEditingController();
  final TextEditingController tresorierController = TextEditingController();
  final TextEditingController secretaireController = TextEditingController();
  final TextEditingController membreController = TextEditingController();
  final TextEditingController localisationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController siteWebController = TextEditingController();
  final AssocService assocService = AssocService();
  int activeIndex = 0;

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
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                        child: Stack(children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Image.asset('assets/img/logo_assoc.jpg',
                                height: 400),
                          )
                        ]),
                      ),
                      // const Text("Inscription association", style: TextStyle(fontSize: 25)),
                      const SizedBox(height: 25),
                      AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: getSignup(),
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                      ),
                      const SizedBox(height: 25),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: getButton(),
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
        activeIndex++;
      });
    }
  }, Colors.black);

  late Widget midButton = Row(
    children: [
      RadiusButton('Retour', () {
        setState(() {
          activeIndex--;
        });
      }, Colors.black),
      initialButton,
    ],
  );

  late Widget finalButton = Row(children: [
    RadiusButton('Retour', () {
      setState(() {
        activeIndex--;
      });
    }, Colors.black),
    RadiusButton("S'inscrire", () async {
      if (_formKey.currentState!.validate()) {
        showSnackBar(context, 'Inscription en cours...', Colors.grey);
        await assocService
            .createAssoc(
                nameController.text,
                siretController.text,
                presidentController.text,
                tresorierController.text,
                secretaireController.text,
                membreController.text,
                localisationController.text,
                descriptionController.text,
                mailController.text,
                siteWebController.text)
            .then((value) {
          if (value == true) {
            Navigator.pushNamed(context, '/main');
            showSnackBar(context, 'Inscription réussie !', Colors.green);
          }
        });
      }
    }, Colors.black)
  ]);

  late Widget initialSignup = Column(children: [
    TextForm(
        nameController,
        "Nom de l'association",
        (value) => value!.validateLastName(),
        Icons.business,
        false,
        () {},
        TextInputType.text),
    const SizedBox(height: 20),
    TextForm(siretController, 'N° Siret', (p0) => p0!.validateSiret(),
        Icons.assignment, false, () {}, TextInputType.text),
    const SizedBox(height: 20),
    TextForm(
        presidentController,
        "Nom complet du président",
        (value) => value!.validateLastName(),
        Icons.hail,
        false,
        () {},
        TextInputType.text),
  ]);

  late Widget secondSignup = Column(children: [
    TextForm(
        tresorierController,
        'Nom complet du Trésorier',
        (p0) => p0!.validateLastName(),
        Icons.price_check,
        false,
        () {},
        TextInputType.text),
    const SizedBox(height: 20),
    TextForm(
        secretaireController,
        'Nom complet du Secrétaire',
        (p0) => p0!.validateLastName(),
        Icons.assistant,
        true,
        () {},
        TextInputType.text),
    const SizedBox(height: 20),
    AppTextField(
        textEditingController: membreController,
        isCitySelected: true,
        cities: [
          SelectedListItem(false, '1-10'),
          SelectedListItem(false, '10-20'),
          SelectedListItem(false, '20-50'),
          SelectedListItem(false, '+50'),
        ],
        text: 'Nombre de membre')
  ]);

  late Widget thirdSignup = Column(children: [
    TextForm(localisationController, 'Localisation', (value) {},
        Icons.location_on, false, () {}, TextInputType.text),
    const SizedBox(height: 20),
    TextForm(
      descriptionController,
      'Description',
      (p0) {},
      Icons.text_fields,
      false,
      () {},
      TextInputType.multiline,
    ),
  ]);

  late Widget finalSignup = Column(children: [
    TextForm(mailController, 'Email', (value) => value!.validateEmail(),
        Icons.mail, false, () {}, TextInputType.text),
    const SizedBox(height: 20),
    TextForm(siteWebController, 'Site web', (p0) {}, Icons.add_link, false,
        () {}, TextInputType.text),
  ]);

  Widget getSignup() {
    switch (activeIndex) {
      case 0:
        return initialSignup;
      case 1:
        return secondSignup;
      case 2:
        return thirdSignup;
      case 3:
        return finalSignup;
      default:
        return initialSignup;
    }
  }

  Widget getButton() {
    switch (activeIndex) {
      case 0:
        return initialButton;
      case 2:
      case 1:
        return midButton;
      case 3:
        return finalButton;
      default:
        return initialButton;
    }
  }
}

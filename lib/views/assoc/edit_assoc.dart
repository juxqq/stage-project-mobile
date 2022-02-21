import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:mobile_app/models/assoc.dart';
import 'package:mobile_app/services/assoc_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/dropdown_list.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

class EditJob extends StatefulWidget {
  const EditJob({Key? key}) : super(key: key);

  @override
  _EditJobState createState() => _EditJobState();
}

class _EditJobState extends State<EditJob> {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController siretController = TextEditingController();
  final TextEditingController presidentController = TextEditingController();
  final TextEditingController tresorierController = TextEditingController();
  final TextEditingController secretaireController = TextEditingController();
  final TextEditingController nbMembreController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController siteWebController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  final TextEditingController cpController = TextEditingController();
  late Assoc assoc;

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
                                const Text("Modifier une association",
                                    style: TextStyle(fontSize: 40)),

                                const SizedBox(
                                  height: 50,
                                ),
                                TextForm(
                                    nameController,
                                    "Nom de l'association",
                                        (value) => value!.validateLastName(),
                                    Icons.business,
                                    false,
                                        () {},
                                    TextInputType.text),
                                //A modifier avec la requère SQL adapté
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(siretController, 'N° Siret', (p0) => p0!.validateSiret(),
                                    Icons.assignment, false, () {}, TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    presidentController,
                                    "Nom complet du président",
                                        (value) => value!.validateLastName(),
                                    Icons.hail,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    tresorierController,
                                    'Nom complet du Trésorier',
                                        (p0) => p0!.validateLastName(),
                                    Icons.price_check,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    secretaireController,
                                    'Nom complet du Secrétaire',
                                        (p0) => p0!.validateLastName(),
                                    Icons.assistant,
                                    true,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                AppTextField(
                                    textEditingController: nbMembreController,
                                    isCitySelected: true,
                                    cities: [
                                      SelectedListItem(false, '1-10'),
                                      SelectedListItem(false, '10-20'),
                                      SelectedListItem(false, '20-50'),
                                      SelectedListItem(false, '+50'),
                                    ],
                                    text: 'Nombre de membre'),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                  descriptionController,
                                  'Description',
                                      (p0) {},
                                  Icons.text_fields,
                                  false,
                                      () {},
                                  TextInputType.multiline,
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(mailController, 'Email', (value) => value!.validateEmail(),
                                    Icons.mail, false, () {}, TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(siteWebController, 'Site web', (p0) {}, Icons.add_link, false,
                                        () {}, TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(adresseController, 'Adresse', (value) {},
                                    Icons.location_on, false, () {}, TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(cpController, 'Code postal', (value) {},
                                    Icons.location_on, false, () {}, TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(villeController, 'Ville', (value) {},
                                    Icons.location_on, false, () {}, TextInputType.text),
                                const SizedBox(
                                  height: 30,
                                ),
                                RadiusButton("Confirmer les modifications", () {
                                  if (_formKey.currentState!.validate()) {
                                    AssocService.updateAssoc(assoc, {
                                      "name": nameController.text,
                                      "siret": siretController.text,
                                      "president": presidentController.text,
                                      "tresorier": tresorierController.text,
                                      "secretaire": secretaireController.text,
                                      "nbMembre": nbMembreController.text,
                                      "description": descriptionController.text,
                                      "mail": mailController.text,
                                      "siteWeb": siteWebController.text,
                                      "adresse": adresseController.text,
                                      "cp": cpController.text,
                                      "ville": villeController.text,
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
                                              'Modification'
                                                  ' impossible pour le moment.',
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

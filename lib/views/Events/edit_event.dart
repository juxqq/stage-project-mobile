import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/event.dart';
import 'package:mobile_app/services/event_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({Key? key}) : super(key: key);

  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController publicViseController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController datePublicationController = TextEditingController();
  final TextEditingController dateReservationMaxController = TextEditingController();
  final TextEditingController dateEvenementController = TextEditingController();
  final TextEditingController organisateurPrincipalController = TextEditingController();
  final TextEditingController autreOrganisateursController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController cpController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  late Event event;

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
                                const Text("Modifier un événement",
                                    style: TextStyle(fontSize: 40)),

                                const SizedBox(
                                  height: 50,
                                ),
                                TextForm(
                                    nameController,
                                    'Nom',
                                        (value) => value!.validateLastName(),
                                    Icons.person,
                                    false,
                                        () {},
                                    TextInputType.text),
                                //A modifier avec la requère SQL adapté
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    publicViseController,
                                    'Public visé',
                                    (value) {},
                                    Icons.person,
                                    false,
                                        () {},
                                    TextInputType.text),
                                //A modifier avec la requère SQL adapté
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    descriptionController,
                                    'Description',
                                        (value) {},
                                    Icons.text_fields,
                                    false,
                                        () {},
                                    TextInputType.multiline),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    datePublicationController,
                                    'Date de publication',
                                        (value) {},
                                    Icons.date_range,
                                    false,
                                        () {},
                                    TextInputType.datetime),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    dateReservationMaxController,
                                    'Date de réservation max',
                                        (value) {},
                                    Icons.date_range,
                                    false,
                                        () {},
                                    TextInputType.datetime),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    dateEvenementController,
                                    "Date de l'événement",
                                        (value) {},
                                    Icons.date_range,
                                    false,
                                        () {},
                                    TextInputType.datetime),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    organisateurPrincipalController,
                                    "Organistateur principal",
                                        (value) {},
                                    Icons.person,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    autreOrganisateursController,
                                    "Autre(s) organisateur(s)",
                                        (value) {},
                                    Icons.person,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    adresseController,
                                    "Adresse de l'événement",
                                        (value) {},
                                    Icons.location_on_sharp,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    cpController,
                                    "Code postal",
                                        (value) {},
                                    Icons.location_on_sharp,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    villeController,
                                    "Ville",
                                        (value) {},
                                    Icons.location_on_sharp,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 30,
                                ),
                                RadiusButton("Confirmer les modifications", () {
                                  if (_formKey.currentState!.validate()) {
                                    EventService.updateEvent(event, {
                                      "name": nameController.text,
                                      "publicVise": publicViseController.text,
                                      "description": descriptionController.text,
                                      "datePublication": datePublicationController.text,
                                      "dateReservationMax": dateReservationMaxController.text,
                                      "dateEvenement": dateEvenementController.text,
                                      "organisateurPrincipal": organisateurPrincipalController.text,
                                      "autreOrganisateurs": autreOrganisateursController.text,
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

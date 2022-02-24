import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/job.dart';
import 'package:mobile_app/services/emploi_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:mobile_app/widgets/dropdown_list.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

class EditJob extends StatefulWidget {
  final Job job;
  const EditJob(this.job, {Key? key}) : super(key: key);

  @override
  _EditJobState createState() => _EditJobState();
}

class _EditJobState extends State<EditJob> {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController intituleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController typeContratController = TextEditingController();
  final TextEditingController remunerationController = TextEditingController();
  final TextEditingController assocController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController dateFinController = TextEditingController();
  final TextEditingController competencesController = TextEditingController();
  final TextEditingController niveauEtudesController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController secteurController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController cpController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  late Job job;

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
                                const Text("Modifier une annonce d'emploi",
                                    style: TextStyle(fontSize: 40)),

                                const SizedBox(
                                  height: 50,
                                ),
                                TextForm(
                                    intituleController,
                                    "Intitulé de l'emploi",
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
                                AppTextField(
                                    textEditingController: typeContratController,
                                    isCitySelected: true,
                                    cities: [
                                      SelectedListItem(false, 'CDD'),
                                      SelectedListItem(false, 'CDI'),
                                      SelectedListItem(false, 'Apprentissage'),
                                      SelectedListItem(false, 'Stagiaire'),
                                      SelectedListItem(false, 'Autre'),
                                    ],
                                    text: 'Type de contrat'),
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    remunerationController,
                                    'Rémunération',
                                        (value) {},
                                    Icons.text_fields,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    assocController,
                                    'Association',
                                        (value) {},
                                    Icons.text_fields,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                TextForm(
                                    typeContratController,
                                    'Type de contrat',
                                        (value) {},
                                    Icons.text_fields,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    dateController,
                                    'Date de début',
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
                                    dateFinController,
                                    'Date de fin',
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
                                    competencesController,
                                    "Compétences",
                                        (value) {},
                                    Icons.date_range,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    niveauEtudesController,
                                    "Niveau d'études",
                                        (value) {},
                                    Icons.date_range,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                TextForm(
                                    experienceController,
                                    "Expérience",
                                        (value) {},
                                    Icons.date_range,
                                    false,
                                        () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 70,
                                ),
                                //Box pour le telephone
                                AppTextField(
                                    textEditingController: secteurController,
                                    isCitySelected: true,
                                    cities: [
                                      SelectedListItem(false, 'Agroalimentaire'),
                                      SelectedListItem(false, 'Bois / Papier / Carton / Imprimerie'),
                                      SelectedListItem(false, 'Chimie / Parachimie'),
                                      SelectedListItem(false, 'Édition / Communication / Multimédia'),
                                      SelectedListItem(false, 'Études et conseils'),
                                      SelectedListItem(false, 'Machines et équipements / Automobile'),
                                      SelectedListItem(false, 'Plastique / Caoutchouc'),
                                      SelectedListItem(false, 'Textile / Habillement / Chaussure'),
                                      SelectedListItem(false, 'Banque / Assurance'),
                                      SelectedListItem(false, 'BTP / Matériaux de construction'),
                                      SelectedListItem(false, 'Commerce / Négoce / Distribution'),
                                      SelectedListItem(false, 'Électronique / Électricité'),
                                      SelectedListItem(false, 'Industrie pharmaceutique'),
                                      SelectedListItem(false, 'Informatique / Télécoms'),
                                      SelectedListItem(false, 'Métallurgie / Travail du métal'),
                                      SelectedListItem(false, 'Services aux entreprises'),
                                      SelectedListItem(false, 'Transports / Logistique'),
                                    ],
                                    text: 'Secteur'),
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
                                    EmploiService.updateJob(job, {
                                      "intitule": intituleController.text,
                                      "description": descriptionController.text,
                                      "typeContrat": typeContratController.text,
                                      "remuneration": remunerationController.text,
                                      "assoc": assocController.text,
                                      "date": dateController.text,
                                      "dateFin": dateFinController.text,
                                      "competences": competencesController.text,
                                      "niveauEtudes": niveauEtudesController.text,
                                      "experience": experienceController.text,
                                      "secteur": secteurController.text,
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

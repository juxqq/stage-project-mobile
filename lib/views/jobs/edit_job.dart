import 'package:flutter/material.dart';
import 'package:mobile_app/extensions/validator_extensions.dart';
import 'package:mobile_app/models/job.dart';
import 'package:mobile_app/services/emploi_service.dart';
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
  DateTime date = DateTime.now();
  DateTime dateFin = DateTime.now();
  RangeValues experience = const RangeValues(0, 10);
  //setup dates pour dateRange
  DateTimeRange dateRange = DateTimeRange(
      start: DateTime(2022,02, 5),
      end: DateTime(2100, 02,5)
  );

  Widget build(BuildContext context) {
    final debut = dateRange.start;
    final fin = dateRange.end;




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
                                TextForm(
                                    secteurController,
                                    "Secteur",
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

                                Text('Date de début et date de fin'),

                                Container(
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          _selectDateDebut(context);
                                        },
                                        child: Text("${date.day}/${date.month}/${date.year}"),
                                        style:
                                        ElevatedButton.styleFrom(primary: Colors.green),
                                      ),
                                      const SizedBox( width: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          _selectDateFin(context);
                                        },
                                        child: Text("${dateFin.day}/${dateFin.month}/${dateFin.year}"),
                                        style:
                                        ElevatedButton.styleFrom(primary: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),

                                //DateRangePicker test non fonctionnel

                                /*Container (
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      ElevatedButton(
                                          onPressed: () async {
                                            final picked = await showDateRangePicker(
                                                context: context,
                                                firstDate: dateFin,
                                                lastDate: new DateTime(2022),
                                            );
                                            if (picked != null && picked != null) {
                                              print(picked);
                                              setState(() {
                                                 date = picked.start;
                                                 dateFin = picked.end;
                                                //methode récupération de la date
                                                recupDatesFuture = _recupDatesFuture(
                                                  picked.start.toIso8601String(),
                                                  picked.end
                                                    .add(new Duration(hours: 24))
                                                    .toIso8601String());

                                              }
                                              );
                                            }
                                          },
                                          child: Text("Sélectionner la date de début et de fin de l'emploi"),
                                          style: ElevatedButton.styleFrom(primary: Colors.green),
                                      )
                                    ]
                                  ),
                                ),*/
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
                                      "date": date,
                                      "dateFin": dateFin,
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

  _selectDateDebut(BuildContext) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2022),
        lastDate: DateTime(2122));
    if (selected != null && selected != date)
      setState(() {
        date = selected;
      });
  }

  _selectDateFin(BuildContext) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: dateFin,
        firstDate: DateTime(2022),
        lastDate: DateTime(2122));
    if (selected != null && selected != dateFin)
      setState(() {
        dateFin = selected;
      });
  }
}






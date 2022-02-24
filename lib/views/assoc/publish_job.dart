import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/emploi_service.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/text_form.dart';

class PublishJob extends StatefulWidget {
  const PublishJob({Key? key}) : super(key: key);

  @override
  _PublishJobState createState() => _PublishJobState();
}

class _PublishJobState extends State<PublishJob> {
  final TextEditingController intituleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController typeContratController = TextEditingController();
  final TextEditingController remunerationController = TextEditingController();
  DateTime date = DateTime.now();
  DateTime dateFin = DateTime.now();
  DateTime datePublication = DateTime.now();
  DateTime dateUpdate = DateTime.now();
  final TextEditingController competencesController = TextEditingController();
  final TextEditingController niveauEtudesController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController secteurController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController cpController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  RangeValues experience = const RangeValues(40, 80);

  //Liste  choix
  var typeContrat = [
    'CDD',
    'CDI',
    'Stage',
    'Benevolat',
    'Alternance',

  ];


  //late User user;

  @override
  void initState() {
    super.initState();

    loadUser();
  }

  void loadUser() async {
    var data = await UserService.getUserId();
    //this.user = User.fromJson(data);
    /* if (user == null) {
      Navigator.of(context).pushNamed('/main');
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text("Publier une annonce d'emploi",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextForm(intituleController, 'Intitulé', (value) {},
                        Icons.title, false, () {}, TextInputType.text),
                    const SizedBox(height: 10),
                    TextForm(
                        descriptionController,
                        'Description',
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    const SizedBox(height: 10),
                    TextForm(
                        typeContratController,
                        "Type de contrat",
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    const SizedBox(height: 10),
                    TextForm(
                        remunerationController,
                        "Remuneration",
                        (p0) => null,
                        Icons.euro,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        competencesController,
                        "Compétences requises",
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        niveauEtudesController,
                        "Niveau requis",
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        experienceController,
                        "Experience requise",
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    const Text ("Experience requise pour l'emploi (Bac +)"),
                    Container(
                      child:
                      RangeSlider(
                        values: experience,
                        max: 15,
                        divisions: 15,
                        labels: RangeLabels(
                          experience.start.round().toString(),
                          experience.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            experience = values;
                          });
                        },
                        activeColor: Colors.black,
                      ),
                    ),
                    TextForm(
                        secteurController,
                        "secteur de l'emploi",
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        adresseController,
                        "Adresse",
                            (p0) => null,
                        Icons.add_location,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        cpController,
                        "Code postal",
                            (p0) => null,
                        Icons.add_location,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        villeController,
                        "Ville",
                            (p0) => null,
                        Icons.add_location,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                      Container(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                _selectDateDebut(context);
                              },
                              child: Text("Date de début"),
                              style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                            ),
                            const SizedBox( width: 10),
                            ElevatedButton(
                              onPressed: () {
                                _selectDateFin(context);
                              },
                              child: Text("Date de fin"),
                              style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                            ),
                          ],
                        ),
                      ),


                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          EmploiService.createJob(
                                  intituleController.text,
                                  descriptionController.text,
                                  typeContratController.text,
                                  remunerationController.text,
                                  1,
                                  date,
                                  dateFin,
                                  datePublication,
                                  dateUpdate,
                                  competencesController.text,
                                  niveauEtudesController.text,
                                  secteurController.text,
                                  adresseController.text,
                                  cpController.text,
                                  villeController.text,
                                  experience
                          )
                              .then((value) {
                            if (value == true) {
                              showSnackBar(
                                  context,
                                  "Votre offre d'emploi à été publiée",
                                  Colors.green);
                            } else {
                              showSnackBar(
                                  context,
                                  "Erreur lors de la publication de l'annonce",
                                  Colors.red);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 30)),
                        child: const Text("Publier l'annonce",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ))),
      bottomNavigationBar: const AppBarWidget(),
    );
  }

  _selectDateDebut(BuildContext) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2022),
        lastDate: DateTime(2122));
    if (selected != null && selected != date) {
      setState(() {
        date = selected;
      });
    }
  }

  _selectDateFin(BuildContext) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: dateFin,
        firstDate: DateTime(2022),
        lastDate: DateTime(2122));
    if (selected != null && selected != dateFin) {
      setState(() {
        dateFin = selected;
      });
    }
  }



}

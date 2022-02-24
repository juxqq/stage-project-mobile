import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/emploi_service.dart';
import 'package:mobile_app/services/event_service.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:path/path.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

class PublishEvent extends StatefulWidget {
  const PublishEvent({Key? key}) : super(key: key);

  @override
  _PublishEventState createState() => _PublishEventState();
}

class _PublishEventState extends State<PublishEvent> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController publicViseController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime datePublication = DateTime.now();
  DateTime dateEvent = DateTime.now();
  DateTime dateReservationMax = DateTime.now();
  final TextEditingController autreOrganisateurController =
      TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController cpController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  File? _image;
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
                    const Text("Annoncer un évènement",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextForm(nomController, 'Intitulé', (value) {}, Icons.title,
                        false, () {}, TextInputType.text),
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
                        publicViseController,
                        "Public Visé",
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        autreOrganisateurController,
                        "Autres Organisations",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              _selectDateEvent(context);
                            },
                            child: Text("date de debut de l'évènement"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              _selectDateReservation(context);
                            },
                            child: Text("date maximale de réservation"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RadiusButton('Choisir dans la galerie', () async {
                      final image = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      if (image == null) {
                        return;
                      }

                      final imageTemporary = File(image.path);
                      setState(() {
                        _image = imageTemporary;
                      });
                      upload(_image!, "events");
                    }, Colors.black),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          EventService.createEvent(
                                  nomController,
                                  publicViseController,
                                  descriptionController.text,
                                  dateEvent,
                                  datePublication,
                                  dateReservationMax,
                                  autreOrganisateurController,
                                  1,
                                  adresseController.text,
                                  cpController.text,
                                  villeController.text,
                                  basename(_image!.path))
                              .then((value) {
                            if (value == true) {
                              showSnackBar(context,
                                  "Votre évènement a été publié", Colors.green);
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

  _selectDateEvent(context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: dateEvent,
        firstDate: DateTime(2022),
        lastDate: DateTime(2122));
    if (selected != null && selected != dateEvent) {
      setState(() {
        dateEvent = selected;
      });
    }
  }

  _selectDateReservation(context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: dateReservationMax,
        firstDate: DateTime(2022),
        lastDate: DateTime(2122));
    if (selected != null && selected != dateReservationMax) {
      setState(() {
        dateReservationMax = selected;
      });
    }
  }
}

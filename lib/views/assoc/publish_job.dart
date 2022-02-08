import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/emploi_service.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/bottom_nav_bar.dart';
import 'package:mobile_app/share/text_form.dart';
import 'package:mobile_app/utils/utils.dart';

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
  final TextEditingController localisationController = TextEditingController();
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
                    TextForm(intituleController, 'Intitulé', (value) {}, Icons.title,
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
                        typeContratController,
                        "Type de contrat",
                            (p0) => null,
                        Icons.text_fields,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
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
                        localisationController,
                        "localisation",
                            (p0) => null,
                        Icons.add_location,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          EmploiService.createJob(
                            intituleController.text,
                            descriptionController.text,
                            typeContratController.text,
                            remunerationController.text,
                            1,
                            localisationController.text,
                          )
                        .then((value){
                          if (value == true){
                            showSnackBar(context, "Votre offre d'emploi à été publiée", Colors.green);
                          } else {
                            showSnackBar(context, "Erreur lors de la publication de l'annonce", Colors.red);
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
}
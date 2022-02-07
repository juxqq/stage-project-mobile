import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/share/bottom_nav_bar.dart';
import 'package:mobile_app/share/text_form.dart';

class PublishJob extends StatefulWidget {
  const PublishJob({Key? key}) : super(key: key);

  @override
  _PublishJobState createState() => _PublishJobState();
}

class _PublishJobState extends State<PublishJob> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController resumeController = TextEditingController();
  final TextEditingController textController = TextEditingController();
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
                    TextForm(titleController, 'Intitulé', (value) {}, Icons.title,
                        false, () {}, TextInputType.text),
                    const SizedBox(height: 10),
                    TextForm(
                        resumeController,
                        'Description',
                            (p0) => null,
                        Icons.text_fields,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    const SizedBox(height: 10),
                    TextForm(
                        textController,
                        "Type de contrat",
                            (p0) => null,
                        Icons.text_fields,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        textController,
                        "Remuneration",
                            (p0) => null,
                        Icons.text_fields,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        textController,
                        "Type de contrat",
                            (p0) => null,
                        Icons.text_fields,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    TextForm(
                        textController,
                        "localisation",
                            (p0) => null,
                        Icons.text_fields,
                        false,
                            () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {},
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
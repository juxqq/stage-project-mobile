import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/text_form.dart';

class PublishArticle extends StatefulWidget {
  const PublishArticle({Key? key}) : super(key: key);

  @override
  _PublishArticleState createState() => _PublishArticleState();
}

class _PublishArticleState extends State<PublishArticle> {
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
                    const Text('Publier un article',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    TextForm(titleController, 'Titre', (value) {}, Icons.title,
                        false, () {}, TextInputType.text),
                    const SizedBox(height: 10),
                    TextForm(
                        resumeController,
                        'Resumer',
                        (p0) => null,
                        Icons.text_fields,
                        false,
                        () => null,
                        TextInputType.multiline,
                        maxLines: null),
                    const SizedBox(height: 10),
                    TextForm(
                        textController,
                        "Texte de l'article",
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
                        child: const Text('Publier',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ))),
      bottomNavigationBar: const AppBarWidget(),
    );
  }
}

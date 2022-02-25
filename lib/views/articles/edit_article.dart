import 'package:flutter/material.dart';
import 'package:mobile_app/models/article.dart';
import 'package:mobile_app/services/article_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/radius_button.dart';
import 'package:mobile_app/widgets/text_form.dart';

class EditArticle extends StatefulWidget {
  const EditArticle({Key? key}) : super(key: key);

  @override
  _EditArticleState createState() => _EditArticleState();
}

class _EditArticleState extends State<EditArticle> {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController resumeController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  late Article article;

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
                                const Text("Modifier un article",
                                    style: TextStyle(fontSize: 40)),

                                const SizedBox(
                                  height: 50,
                                ),
                                TextForm(
                                    titleController,
                                    "Titre de l'article",
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
                                    resumeController,
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
                                    textController,
                                    "Texte de l'article",
                                    (value) {},
                                    Icons.text_fields,
                                    false,
                                    () {},
                                    TextInputType.text),
                                const SizedBox(
                                  height: 30,
                                ),
                                RadiusButton("Confirmer les modifications", () {
                                  if (_formKey.currentState!.validate()) {
                                    ArticleService.updateArticle(article, {
                                      "title": titleController.text,
                                      "resume": resumeController.text,
                                      "text": textController.text,
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
        bottomNavigationBar: const AppBarWidget(0));
  }
}

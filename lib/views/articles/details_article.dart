import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/models/article.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';

class ArticleDetails extends StatefulWidget {
  final Article article;

  const ArticleDetails(this.article, {Key? key}) : super(key: key);

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title:
              Text(widget.article.title, style: const TextStyle(fontSize: 14)),
          centerTitle: true,
          backgroundColor: Colors.green[500]),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                widget.article.image,
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.article.title,
                        style: const TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.article.text))
              ]))),
      bottomNavigationBar: const AppBarWidget(),
    );
  }
}

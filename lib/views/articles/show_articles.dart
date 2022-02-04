import 'package:flutter/material.dart';
import 'package:mobile_app/services/article_service.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';

class ShowArticles extends StatefulWidget {
  const ShowArticles({Key? key}) : super(key: key);

  @override
  _ShowArticlesState createState() => _ShowArticlesState();
}

class _ShowArticlesState extends State<ShowArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: FutureBuilder(
                  future: ArticleService.getArticles(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return Column(
                          children: List.generate(
                              (snapshot.data as List).length, (index) {
                        return Container();
                      }));
                    }
                  }))),
      bottomNavigationBar: const AppBarWidget(),
    );
  }
}

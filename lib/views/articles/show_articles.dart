import 'package:flutter/material.dart';
import 'package:mobile_app/services/article_service.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/views/articles/details_article.dart';
import 'package:mobile_app/widgets/bottom_nav_bar.dart';
import 'package:mobile_app/widgets/search.dart';

class ShowArticles extends StatefulWidget {
  const ShowArticles({Key? key}) : super(key: key);

  @override
  _ShowArticlesState createState() => _ShowArticlesState();
}

class _ShowArticlesState extends State<ShowArticles> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SearchWidget(
          searchArticlesWidget(titleController, authorController, context)),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: const Text('Liste des articles'),
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: ArticleService.getArticles(titleController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasData) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _buildCardArticle(snapshot.data as List<dynamic>));
                } else {
                  return const Text('Aucune donnee');
                }
              })),
      bottomNavigationBar: const AppBarWidget(),
    );
  }

  _buildCardArticle(data) {
    return Column(
        children: List.generate(data.length, (index) {
      return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ArticleDetails(data[index])));
          },
          child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10.0),
                      top: Radius.circular(2.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(data[index].title),
                    leading: const Icon(Icons.article),
                  ),
                  data[index].image,
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(data[index].resume),
                  )
                ],
              )));
    }));
  }
}

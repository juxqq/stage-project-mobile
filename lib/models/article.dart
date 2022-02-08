class Article {
  final int id;
  final String title;
  final String resume;
  final String text;
  final DateTime publishedDate;
  final DateTime updateDate;
  final int authorId;

  Article(this.id, this.title, this.resume, this.text, this.publishedDate,
      this.updateDate, this.authorId);

  Article.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        title = json['title'],
        resume = json['resume'],
        text = json['text'],
        publishedDate = DateTime.parse(json['publishedDate']),
        updateDate = DateTime.parse(json['editedDate']),
        authorId = int.parse(json['author']);
}

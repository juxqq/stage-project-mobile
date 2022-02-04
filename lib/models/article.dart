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
      : id = json['id'],
        title = json['title'],
        resume = json['resume'],
        text = json['text'],
        publishedDate = json['publishedDate'],
        updateDate = json['editedDate'],
        authorId = json['author'];
}

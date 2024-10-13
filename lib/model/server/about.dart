class About {
  final int id;
  final String title;
  final String content;

  About({required this.id, required this.title, required this.content});

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}

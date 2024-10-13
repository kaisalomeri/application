class Help {
  final int id;
  final String title;
  final String content;

  Help({required this.id, required this.title, required this.content});

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}

class Note {
  String title;
  String category;

  Note({required this.title, required this.category});

  Map<String, dynamic> toJson() => {
        "title": title,
        "category": category,
      };

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      category: json['category'],
    );
  }
}
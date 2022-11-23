class Book {
  int id;
  String title;
  int userId;

  // TODO(Rob): Add missing fields

  Book({
    required this.id,
    required this.title,
    required this.userId,
  });

  factory Book.fromJson(final Map<String, dynamic> json) => Book(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'userId': userId,
      };
}

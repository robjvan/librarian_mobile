class Book {
  int id;
  String title;
  String description;
  int pageCount;
  int authorId;
  int publisherId;
  int publishYearId;
  int userId;
  bool haveRead;
  bool inWishlist;
  bool inShoppingList;
  bool inFavesList;
  int isbn10;
  int isbn13;
  bool isMature;
  int rating;
  String sortTitle;
  String sortAuthor;
  String thumbnailUrl;

  Book({
    required this.id,
    required this.title,
    required this.userId,
    required this.description,
    required this.pageCount,
    required this.authorId,
    required this.publisherId,
    required this.publishYearId,
    required this.haveRead,
    required this.inWishlist,
    required this.inShoppingList,
    required this.inFavesList,
    required this.isbn10,
    required this.isbn13,
    required this.isMature,
    required this.rating,
    required this.sortTitle,
    required this.sortAuthor,
    required this.thumbnailUrl,
  });

  factory Book.fromJson(final Map<String, dynamic> json) => Book(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
        description: json['description'],
        pageCount: json['pageCount'],
        authorId: json['authorId'],
        publisherId: json['publisherId'],
        publishYearId: json['publishYearId'],
        haveRead: json['haveRead'],
        inWishlist: json['inWishlist'],
        inShoppingList: json['inShoppingList'],
        inFavesList: json['inFavesList'],
        isbn10: json['isbn10'],
        isbn13: json['isbn13'],
        isMature: json['isMature'],
        rating: json['rating'],
        sortTitle: json['sortTitle'],
        sortAuthor: json['sortAuthor'],
        thumbnailUrl: json['thumbnailUrl'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'userId': userId,
        'description': description,
        'pageCount': pageCount,
        'authorId': authorId,
        'publisherId': publisherId,
        'publishYearId': publishYearId,
        'haveRead': haveRead,
        'inWishlist': inWishlist,
        'inShoppingList': inShoppingList,
        'inFavesList': inFavesList,
        'isbn10': isbn10,
        'isbn13': isbn13,
        'isMature': isMature,
        'rating': rating,
        'sortTitle': sortTitle,
        'sortAuthor': sortAuthor,
        'thumbnailUrl': thumbnailUrl,
      };
}

class Book {
  int? id;
  String title;
  int? titleId;
  String? description;
  int? pageCount;
  int? authorId;
  int? publisherId;
  int? publishYearId;
  String? author;
  String? publisher;
  int? publishYear;
  int? userId;
  bool? haveRead;
  bool? inWishlist;
  bool? inShoppingList;
  bool? inFavesList;
  int? isbn10;
  int? isbn13;
  bool? isMature;
  int? rating;
  String? sortTitle;
  String? sortAuthor;
  String? thumbnailUrl;

  Book({
    this.id,
    required this.title,
    this.titleId,
    this.userId,
    this.description,
    this.pageCount,
    this.authorId,
    this.author,
    this.publisherId,
    this.publisher,
    this.publishYearId,
    this.publishYear,
    this.haveRead,
    this.inWishlist,
    this.inShoppingList,
    this.inFavesList,
    this.isbn10,
    this.isbn13,
    this.isMature,
    this.rating,
    this.sortTitle,
    this.sortAuthor,
    this.thumbnailUrl,
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

  // Map<String, dynamic> toJson() => <String, dynamic>{
  //       'id': id,
  //       'title': title,
  //       'userId': userId,
  //       'description': description,
  //       'pageCount': pageCount,
  //       'authorId': authorId,
  //       'publisherId': publisherId,
  //       'publishYearId': publishYearId,
  //       'haveRead': haveRead,
  //       'inWishlist': inWishlist,
  //       'inShoppingList': inShoppingList,
  //       'inFavesList': inFavesList,
  //       'isbn10': isbn10,
  //       'isbn13': isbn13,
  //       'isMature': isMature,
  //       'rating': rating,
  //       'sortTitle': sortTitle,
  //       'sortAuthor': sortAuthor,
  //       'thumbnailUrl': thumbnailUrl,
  //     };
}

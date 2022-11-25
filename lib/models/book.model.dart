class Book {
  int? id;
  String title;
  // int? titleId;
  String? description;
  // int? descriptionId;
  int? pageCount;
  String? author;
  // int? authorId;
  String? publisher;
  // int? publisherId;
  int? publishYear;
  // int? publishYearId;
  int? userId;
  bool? haveRead;
  bool? inWishlist;
  bool? inShoppingList;
  bool? inFavesList;
  int? isbn10;
  // int? isbn10Id;
  int? isbn13;
  // int? isbn13Id;
  bool? isMature;
  int? rating;
  String? sortTitle;
  String? sortAuthor;
  String? thumbnailUrl;
  // String? thumbnailUrlId;

  Book({
    this.id,
    required this.title,
    this.userId,
    this.description,
    this.pageCount,
    this.author,
    this.publisher,
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

  // TODO(Rob): Adjust these fields to match GBooks API response
  factory Book.fromGbooks(final Map<String, dynamic> json) => Book(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
        description: json['description'],
        pageCount: json['pageCount'],
        author: json['author'],
        publisher: json['publisher'],
        publishYear: json['publishYear'],
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

  factory Book.fromDb(final Map<String, dynamic> json) => Book(
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
        description: json['description'],
        pageCount: json['pageCount'],
        author: json['author'],
        publisher: json['publisher'],
        publishYear: json['publishYear'],
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

  // Convert a book object to a JSON string
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'pageCount': pageCount,
        'author': author,
        'publisher': publisher,
        'publishYear': publishYear,
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

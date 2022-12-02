class Book {
  int? id;
  String title;
  String? description;
  int? pageCount;
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
        title: json['titleId'].toString(),
        userId: json['userId'],
        description: json['descriptionId'].toString(),
        pageCount: json['pageCount'],
        author: json['authorId'].toString(),
        publisher: json['publisherId'].toString(),
        publishYear: json['publishYearId'],
        haveRead: json['haveRead'],
        inWishlist: json['inWishlist'],
        inShoppingList: json['inShoppingList'],
        inFavesList: json['inFavesList'],
        isbn10: json['isbn10Id'],
        isbn13: json['isbn13Id'],
        isMature: json['isMature'],
        rating: json['rating'],
        sortTitle: json['sortTitleId'].toString(),
        sortAuthor: json['sortAuthorId'].toString(),
        thumbnailUrl: json['thumbnailUrlId'].toString(),
      );

  // Convert a book object to a JSON string
  Map<String, dynamic> toCreateBookDto() => <String, dynamic>{
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

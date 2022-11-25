import 'package:get/get.dart';
import 'package:librarian_mobile/controllers/user_data.controller.dart';
import 'package:librarian_mobile/models/book.model.dart';

class BooksApi {
  // final BooksAPIProvider _booksAPIProvider = BooksAPIProvider();
  final UserDataController _booksController = Get.put(UserDataController());

  static void addNewBook(final Book book) {
    //* Use passed book info to generate an entry for the db
    //* - Use Title info to find titleId (or create new entry)
    //* - Use Author info to find authorId (or create new entry)
    //* - Use publisher info to find pushlisherId (or create new entry)
    //* - Use publishYear info to find pushlishYearId (or create new entry)
    //* - Backend will attach userId
    print(book.title);
  }
}

import 'package:get/get.dart';
import 'package:librarian_mobile/models/book.model.dart';

class BooksController extends GetxController {
  // TODO(Rob): Download DB to local list for on-device processing?
  // TODO(Rob): When an action is taken, update both the local list and backend DB?

  final RxList<Book> _userBooks = <Book>[].obs;
  List<Book> get userBooks => _userBooks;

  void addBook(final Book book) {
    _userBooks.add(book);
  }

  void removeRecipeById(final int bookId) {
    _userBooks.removeWhere((final Book book) => book.id == bookId);
  }

  void wipeRecipes() {
    _userBooks.clear();
  }
}

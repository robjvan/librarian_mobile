import 'package:get/get.dart';
import 'package:librarian_mobile/controllers/user_data.controller.dart';

class BooksApi {
  // final BooksAPIProvider _booksAPIProvider = BooksAPIProvider();
  final UserDataController _booksController = Get.put(UserDataController());
}

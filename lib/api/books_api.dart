import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/api/providers/books_api.provder.dart';
import 'package:librarian_mobile/controllers/user_data.controller.dart';
import 'package:librarian_mobile/models/book.model.dart';
import 'package:http/http.dart' as http;
import 'package:librarian_mobile/pages/library_screen/library_screen.dart';

class BooksApi {
  final BooksAPIProvider _booksAPIProvider = BooksAPIProvider();
  final UserDataController _booksController = Get.put(UserDataController());

  void addNewBook(final Book book) async {
    late http.Response? response;
    //* Use passed book info to generate an entry for the db
    //! The backend requires this data to be in the structure of a CreateBookDto
    // Required field: title
    // Optional: description, pageCount, author, publisher, pubhlishYear,
    // haveRead, isMature, inWishlist, inShoppingList, inFavesList, isbn10,
    // isbn13, rating, thumbnailUrl
    // print(jsonEncode(book));

    try {
      response = await _booksAPIProvider.saveNewBook(book);
    } on Exception catch (err) {
      print(err);
    }

    if (response != null) {
      debugPrint(response.body);
    }

    // TODO: Add error handling:
    // 400 - bad request, etc

    if (response!.statusCode == 201) {
      Get.offAll(LibraryScreen());
    }
  }
}

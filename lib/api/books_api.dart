import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/api/providers/books_api.provder.dart';
import 'package:librarian_mobile/controllers/books.controller.dart';
import 'package:librarian_mobile/models/book.model.dart';
import 'package:http/http.dart' as http;
import 'package:librarian_mobile/pages/library_screen/library_screen.dart';

class BooksApi {
  final BooksAPIProvider _booksAPIProvider = BooksAPIProvider();
  final BooksController _booksController = Get.put(BooksController());

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
      debugPrint('$err');
    }

    if (response != null) {
      debugPrint(response.body);
      // TODO: Add error handling:
      // 400 - bad request, etc

      if (response.statusCode == 201) {
        // Status 201 means record was successfully added to DB
        // Add the book to local array
        final BooksController booksCtlr = BooksController();
        booksCtlr.addBook(book);
        Get.offAll(const LibraryScreen());
      }
    } else {
      /// Could not save new book to DB, throw error and investigate reason
    }
  }

  Future<void> fetchBooks() async {
    late http.Response? response;

    /// 1. grab the list of books from the backend
    try {
      response = await _booksAPIProvider.fetchBooks();
      print(response.body);
      if (response != null) {
        /// 2. process into local storage
        List<dynamic> jsonResponse = json.decode(response.body);
        jsonResponse.forEach((book) {
          _booksController.addBook(Book.fromDb(book));
        });
        // String test = response.body;
        // Book.fromDb(test);
    }
    } on Exception catch (err) {
      debugPrint('Could not fetch books from server: $err');
    }

  }
}

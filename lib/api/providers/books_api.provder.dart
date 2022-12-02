import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:librarian_mobile/config/config.dart' as config;
import 'package:librarian_mobile/controllers/auth.controller.dart';
import 'package:librarian_mobile/models/book.model.dart';

@immutable
class BooksAPIProvider {
  final String _apiUrl = 'api/v1/books';
  final AuthController authController = Get.put(AuthController());

  // save new book to DB
  Future<http.Response> saveNewBook(final Book book) {
    final Uri saveUrl = config.getAPIUrl().resolve('$_apiUrl');
    final String token = authController.authToken;

    return http.post(
      saveUrl,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(book.toCreateBookDto()),
    );
  }

  Future<http.Response> fetchBooks() {
    final Uri fetchUrl = config.getAPIUrl().resolve('$_apiUrl');
    final String token = authController.authToken;

    return http.get(fetchUrl,
        headers: <String, String>{'Authorization': 'Bearer $token'});
  }
}

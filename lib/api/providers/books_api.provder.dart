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

  // // Get titleId from DB (backend will create if needed)
  // Future<void> getTitleId(final String title) async {
  //   // TODO(Rob): Add logic to grab title ID from backend

  //   return await null;
  // }

  // // Get authorId from DB
  // Future<void> getAuthorId(final String author) async {
  //   // TODO(Rob): Add logic to grab title ID from backend

  //   return await null;
  // }

  // // Get descriptionId from DB
  // Future<void> getDescriptionId(final String author) async {
  //   // TODO(Rob): Add logic to grab title ID from backend

  //   return await null;
  // }

  // // Get publisherId from DB
  // Future<void> getPublisherId(final String publisher) async {
  //   // TODO(Rob): Add logic to grab title ID from backend

  //   return await null;
  // }

  // // Get publishYearId from DB
  // Future<void> getPublishYearId(final int year) async {
  //   // TODO(Rob): Add logic to grab title ID from backend

  //   return await null;
  // }

  // // Get isbn10 from DB
  // Future<void> getIsbn10Id(final int year) async {
  //   // TODO(Rob): Add logic to grab title ID from backend

  //   return await null;
  // }

  // // Get isbn13 from DB
  // Future<void> getIsbn13Id(final int year) async {
  //   // TODO(Rob): Add logic to grab title ID from backend

  //   return await null;
  // }

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
}

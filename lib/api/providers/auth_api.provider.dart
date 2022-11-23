import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:librarian_mobile/config/config.dart' as config;
import 'package:librarian_mobile/pages/login_screen/login_user.dto.dart';
import 'package:librarian_mobile/pages/register_screen/register_user.dto.dart';

//* The purpose of an API Provider is to handle the direct communication with the DB.
//* It passes requests and returns the raw response without any sort of processing

@immutable
class AuthAPIProvider {
  final String _apiUrl = '/auth';

  /// Sign in as an existing user
  Future<http.Response> signIn(final LoginDto signInCredentials) {
    final Uri signInUrl = config.getAPIUrl().resolve('$_apiUrl/signin');

    return http.post(
      signInUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': signInCredentials.username,
        'password': signInCredentials.password,
        'platform': signInCredentials.platform,
      }),
    );
  }

  /// Sign up a new user
  Future<http.Response> signUp(final RegisterDto signupCredentials) {
    final Uri signupUrl = config.getAPIUrl().resolve('$_apiUrl/signup');

    return http.post(
      signupUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': signupCredentials.username,
          'password': signupCredentials.password,
          'platform': signupCredentials.platform,
        },
      ),
    );
  }

  /// Check if username already exists in DB
  Future<http.Response> checkUsername(final String username) {
    final Uri fetchUrl = config.getAPIUrl().resolve('$_apiUrl/checkusername');

    return http.post(
      fetchUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'username': username}),
    );
  }
}

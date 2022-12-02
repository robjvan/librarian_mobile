import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:librarian_mobile/api/providers/auth_api.provider.dart';
import 'package:librarian_mobile/controllers/api_state.controller.dart';
import 'package:librarian_mobile/controllers/auth.controller.dart';
import 'package:librarian_mobile/models/auth_token.model.dart';
import 'package:librarian_mobile/pages/library_screen/library_screen.dart';
import 'package:librarian_mobile/pages/login_screen/login_screen.dart';
import 'package:librarian_mobile/pages/login_screen/login_user.dto.dart';
import 'package:librarian_mobile/pages/register_screen/register_user.dto.dart';
import 'package:librarian_mobile/widgets/custom_dialogs.widget.dart';

class AuthAPI {
  final AuthAPIProvider _authAPIProvider = AuthAPIProvider();
  final AuthController _authController = Get.put(AuthController());
  final ApiStateController _apiState = Get.put(ApiStateController());

  /// Sign in an existing user
  Future<void> signIn(final LoginDto signInCredentials) async {
    _apiState.setLoadingState(true);
    late http.Response response;

    try {
      response = await _authAPIProvider.signIn(signInCredentials);
      switch (response.statusCode) {
        case 201:
          final AuthTokenModel json =
              AuthTokenModel.fromJson(jsonDecode(response.body));

          // Parse and store authToken
          final String parsedToken = json.token;
          _authController.saveToken(parsedToken);

          /// Navigate to Dashboard
          _apiState.setLoadingState(false);
          await Get.offAll(LibraryScreen.new);
          break;
        case 400:
        case 401:
          await CustomDialogs().buildErrorDialog(
            'Invalid username or password, please try again',
          );
          break;
        case 403:
          await CustomDialogs().buildErrorDialog(
            'Please confirm email address before signing in.',
          );
          break;
        case 404:
          await CustomDialogs().buildErrorDialog(
            'Could not connect to server, please try again later',
          );
          break;
        case 500:
          await CustomDialogs()
              .buildErrorDialog('Server error, please try again later');
          break;
      }
      _apiState.setLoadingState(false);
    } on Exception catch (err) {
      await CustomDialogs().buildErrorDialog(
        'Could not connect to server, please try again later',
      );
      debugPrint(err.toString());
      _apiState.setLoadingState(false);
    }
  }

  /// Check if username already exists in the DB
  Future<bool> checkUsername(final String username) async {
    _apiState.setLoadingState(true);
    http.Response response;

    try {
      response = await _authAPIProvider.checkUsername(username);
      switch (response.statusCode) {
        case 200:
        case 201:
          if (response.body == 'true') {
            return true;
          } else {
            return false;
          }
        case 400:
        case 401:
          break;
        case 404:
          await CustomDialogs().buildErrorDialog(
            'Could not connect to server, please try again later',
          );
          break;
        case 500:
          await CustomDialogs()
              .buildErrorDialog('Server error, please try again later');
          break;
      }
    } on Exception catch (err) {
      await CustomDialogs().buildErrorDialog(
        'Could not connect to the server, please try again later.',
      );
      debugPrint(err.toString());
    }
    return false;
  }

  /// Sign up as a new user
  Future<dynamic> signUp(final RegisterDto signupCredentials) async {
    _apiState.setLoadingState(true);
    late http.Response response;

    try {
      /// Check if username already exists in DB
      bool userAlreadyExists = await checkUsername(signupCredentials.username);

      if (userAlreadyExists) {
        await Get.defaultDialog(
          content: const Text(
            'User account with that email address already exists, please sign in instead.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('Reset Password'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
          ],
        );
      } else {
        try {
          response = await _authAPIProvider.signUp(signupCredentials);

          switch (response.statusCode) {
            case 200:
            case 201:
              // We will receive a User object if user creation was successful
              await CustomDialogs().buildErrorDialog(
                'New account created successfully, please check your inbox for a confirmation email before signing in!',
              );
              _apiState.setLoadingState(false);
              unawaited(Get.offAll(() => const LoginScreen()));
              break;
            case 400:
            case 401:
            case 404:
              await CustomDialogs().buildErrorDialog(
                'Could not connect to server, please try again later',
              );
              break;
            case 500:
              await CustomDialogs()
                  .buildErrorDialog('Server error, please try again later');
              break;
          }
        } on Exception catch (err) {
          debugPrint(err.toString());
          await CustomDialogs()
              .buildErrorDialog('Server error, please try again later');
        }
      }
    } on Exception catch (err) {
      debugPrint(err.toString());
      await CustomDialogs()
          .buildErrorDialog('Server error, please try again later');
    }
    _apiState.setLoadingState(false);
  }
}

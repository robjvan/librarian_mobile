import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/api/auth_api.dart';
import 'package:librarian_mobile/config/config.dart';
import 'package:librarian_mobile/controllers/password_visibilty.controller.dart';
import 'package:librarian_mobile/pages/login_screen/login_screen.dart';
import 'package:librarian_mobile/pages/register_screen/register_user.dto.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final Map<String, dynamic> controllers = <String, dynamic>{
      'username': usernameController,
      'password': passwordController,
    };

    final AuthAPI authAPI = AuthAPI();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildUsernameField(usernameController),
            _buildPasswordField(passwordController),
            const SizedBox(height: 32),
            _buildRegisterButton(authAPI, controllers),
            const SizedBox(height: 16),
            _buildCancelButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameField(final TextEditingController usernameController) =>
      TextFormField(
        decoration: const InputDecoration(
          prefix: Text('Enter username: '),
        ),
        controller: usernameController,
        validator: (final String? value) {
          if (value!.isEmpty) {
            return 'Email address cannot be empty';
          } else if (!value.isEmail) {
            return 'Email must be a valid email address';
          }
          return null;
        },
      );

  Widget _buildRegisterButton(
    final AuthAPI authAPI,
    final Map<String, dynamic> controllers,
  ) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 60),
          maximumSize: const Size(200, 60),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await authAPI.signUp(
              RegisterDto(
                username: controllers['username'].text,
                password: controllers['password'].text,
                platform: await Config().getPlatform(),
              ),
            );
          }
        },
        child: const Text(
          'Register',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );

  Widget _buildCancelButton() {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(200, 40),
        maximumSize: const Size(200, 40),
      ),
      onPressed: () => Get.off(() => const LoginScreen()),
      child: const Text('Cancel'),
    );
  }

  Widget _buildPasswordField(final TextEditingController passwordController) {
    final PasswordVisibiltyController passwordVisibilty = Get.put(
      PasswordVisibiltyController(),
    );

    return Obx(
      () => TextFormField(
        controller: passwordController,
        validator: (final String? value) {
          if (value!.isEmpty) {
            return 'Password cannot be empty';
          }
          return null;
        },
        obscureText: passwordVisibilty.obscurePassword,
        decoration: InputDecoration(
          suffix: IconButton(
            onPressed: passwordVisibilty.toggleVisibility,
            icon: passwordVisibilty.obscurePassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/user.dart';

class AuthController {
  
  Future<void> login({
      required String email,
      required String password,
      String? otp,
    }) async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }

    if (isLoggedIn) {
      debugPrint('Already logged in');
      return;
    }

    await directus!.auth.login(
      email: email,
      password: password,
      otp: otp,
    );
  }

  Future<void> logout() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }

    if (!isLoggedIn) {
      debugPrint('No user to log out');
      return;
    }

    await directus!.auth.logout();
  }

  Future<void> init() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }

    await directus!.auth.init();
  }

  bool get isLoggedIn {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }
    return directus!.auth.isLoggedIn;
  }

  Future<User> get currentUser async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }

    
    return User.fromJson((await directus!.auth.currentUser!.read()).data.toJson());
  }
}
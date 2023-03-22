import 'package:flutter/widgets.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/user.dart';

class AuthController {
  Future<void> login({
    required String email,
    required String password,
    String? otp,
  }) async {
    await directus!.auth.login(
      email: email,
      password: password,
      otp: otp,
    );

    await setCurrentUser();
  }

  Future<void> logout() async {
    if (!isLoggedIn) {
      debugPrint('No user to log out');
      return;
    }

    await directus!.auth.logout();
  }

  bool get isLoggedIn {
    return directus!.auth.isLoggedIn;
  }

  Future<void> setCurrentUser() async {
    if (!isLoggedIn) {
      debugPrint('No user to set');
      return;
    }
  }

  Future<User>? get currentUser async {
    return User.fromJson(
        (await directus!.auth.currentUser!.read()).data.toJson());
  }
}

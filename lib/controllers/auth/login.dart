import 'package:pandasenp_flutter/directus/directus.dart';

Future<void> login({
  required String email,
  required String password,
  String? otp,
}) async {
  if (directus == null) {
    throw Exception('Directus not initialized');
  }

  if (directus!.auth.isLoggedIn) {
    return;
  }
  
  await directus!.auth.login(
    email: email,
    password: password,
    otp: otp,
  );
}
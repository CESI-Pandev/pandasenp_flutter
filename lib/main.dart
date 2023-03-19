import 'package:directus/directus.dart';
import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/pages/welcome.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  directus = await Directus(Env.directusServer).init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,

  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: const WelcomePage(),
    );
  }
}
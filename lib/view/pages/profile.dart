import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/auth.dart';
import 'package:pandasenp_flutter/model/user.dart';
import 'package:pandasenp_flutter/view/widgets/app_base.dart';
import 'package:pandasenp_flutter/view/pages/login.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthController auth = AuthController();

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: "Profile",
      index: kProfileIndex,
      body: FutureBuilder<User>(
        future: auth.currentUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User currentUser = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  // FutureBuilder(
                  //   future: currentUser.getAvatar,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       File avatar = snapshot.data!;
                  //       return CircleAvatar(
                  //         backgroundImage: NetworkImage(avatar.fileNameDownload),
                  //         radius: 50,
                  //       );
                  //     } else if (snapshot.hasError) {
                  //       return const CircleAvatar(
                  //         radius: 50,
                  //       );
                  //     } else {
                  //       return const CircleAvatar(
                  //         radius: 50,
                  //       );
                  //     }
                  //   },
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    currentUser.fullNameOrIdentifier,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    currentUser.email ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      auth.logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: const Text("Logout"),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

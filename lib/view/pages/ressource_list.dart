import 'package:flutter/material.dart';
import 'package:pandasenp_flutter/controllers/ressource.dart';
import 'package:pandasenp_flutter/model/ressource.dart';
import 'package:pandasenp_flutter/view/widgets/app_base.dart';
import 'package:pandasenp_flutter/view/widgets/ressource_card.dart';

const String kRessourceListPageRoute = '/ressource_list';
const String kRessourceListPageTitle = 'Ressources';

class RessourceListPage extends StatefulWidget {
  const RessourceListPage({super.key});

  @override
  State<RessourceListPage> createState() => _RessourceListPageState();
}

class _RessourceListPageState extends State<RessourceListPage> {
  @override
  Widget build(BuildContext context) {
    final RessourceController ressourceController = RessourceController();
    return AppBase(
      index: ressourceListIndex,
      title: kRessourceListPageTitle,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black.withOpacity(0.8),
        onPressed: () {},
        // => Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const NewRessourcePage(),
        //   ),
        // ),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Ressource>>(
        future: ressourceController.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: Text("Erreur inconnue"),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Aucune ressource trouvée"),
            );
          }

          List<Ressource> ressources = snapshot.data!;

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: ListView.builder(
              itemCount: ressources.length,
              itemBuilder: (BuildContext context, int index) {
                return RessourceCardWidget(ressource: ressources[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

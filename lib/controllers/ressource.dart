import 'package:directus/directus.dart';
import 'package:pandasenp_flutter/directus/directus.dart';
import 'package:pandasenp_flutter/model/ressource.dart';

class RessourceController {
  Future<List<Ressource>> getAll() async {
    if (directus == null) {
      throw Exception('Directus not initialized');
    }

    List<Map<String, dynamic>> ressourcesJson;

    try {
      ressourcesJson = await Future.wait(
        (await directus!.items('ressource').readMany()).data.map(
          (ressourceJson) async {
            ressourceJson['user_created'] = (await directus!.users
                    .readOne(ressourceJson['user_created']))
                .data.toJson();
            if (ressourceJson['user_updated'] != null) {
              ressourceJson['user_updated'] = (await directus!.users
                      .readOne(ressourceJson['user_updated']))
                  .data.toJson();
            } else {
              ressourceJson['user_updated'] = ressourceJson['user_created'];
            }
            ressourceJson['category'] = (await directus!
                    .items('category')
                    .readOne(ressourceJson['category'].toString()))
                .data;
            ressourceJson['type'] = (await directus!
                    .items('ressource_type')
                    .readOne(ressourceJson['type'].toString()))
                .data;
            return ressourceJson;
          },
        ),
      );
    } on DirectusError catch (e) {
      return Future.error(e.message);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }

    return ressourcesJson
        .map<Ressource>((ressourceJson) => Ressource.fromJson(ressourceJson))
        .toList();
  }
}

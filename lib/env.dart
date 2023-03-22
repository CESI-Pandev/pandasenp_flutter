import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'DIRECTUS_SERVER')
  static const directusServer = _Env.directusServer;
}

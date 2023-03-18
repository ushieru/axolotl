import 'package:axolotl/packages/podman_api/main.dart';

class PodmanApiSingleton {
  static PodmanApi? _podmanApi;

  PodmanApiSingleton._();

  static PodmanApi getInstance({String? socketConnection}) {
    if (_podmanApi == null && socketConnection == null) {
      throw '[PodmanApiSingleton] _podmanApi == null && socketConnection == null';
    }
    if (_podmanApi == null && socketConnection != null) {
      _podmanApi = PodmanApi(socketConnection);
    }
    return _podmanApi!;
  }
}

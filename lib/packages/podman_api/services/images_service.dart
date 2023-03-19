import 'dart:async';
import 'dart:convert';

import 'package:axolotl/packages/event_handler/event_handler_singleton.dart';
import 'package:axolotl/packages/event_handler/main.dart';
import 'package:axolotl/packages/http_parser/main.dart';
import 'package:axolotl/packages/http_parser/utils/chunk_parse.dart';
import 'package:axolotl/packages/podman_api/main.dart';
import 'package:axolotl/packages/podman_api/models/image.dart';

class ImagesService {
  ImagesService(this._podmanApi);

  final PodmanApi _podmanApi;
  final EventHandler _eventHandler = EventHandlerSingleton.getInstance();

  Future<List<Image>> list() async {
    final completer = Completer<List<Image>>();
    final request = HTTPParser.get('/images/json');
    _eventHandler.add(request.headers['X-Reference-Id']!, (response) {
      if (response.headers.containsKey('Transfer-Encoding') &&
          response.headers['Transfer-Encoding'] == 'chunked') {
        final newBody = ChunkParse(response.body).build();
        response = response.copyWith(body: newBody);
      }
      final imagesJsonList = jsonDecode(response.body) as List<dynamic>;
      final images = imagesJsonList
          .map<Image>((imageJson) => Image.fromJson(imageJson))
          .toList();
      completer.complete(images);
    });
    _podmanApi.request(request);
    return completer.future;
  }
}

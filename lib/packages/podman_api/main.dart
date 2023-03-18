import 'dart:io';

import 'package:axolotl/packages/event_handler/event_handler_singleton.dart';
import 'package:axolotl/packages/event_handler/main.dart';
import 'package:axolotl/packages/http_parser/main.dart';
import 'package:axolotl/packages/podman_api/services/images_service.dart';

class PodmanApi {
  PodmanApi(this.address) {
    imagesService = ImagesService(this);
  }

  Future<Socket> _getSocket() async {
    final host = InternetAddress(address, type: InternetAddressType.unix);
    final socket = await Socket.connect(host, 0);
    socket.listen((payload) {
      final payloadString = String.fromCharCodes(payload);
      final httpParser = HTTPParser.fromString(payloadString);
      final key = httpParser.headers['X-Reference-Id'];
      if (key == null) return;
      _eventHandler.call(key, httpParser);
    });
    return socket;
  }

  final String address;
  final EventHandler _eventHandler = EventHandlerSingleton.getInstance();
  late final ImagesService imagesService;

  Future<void> request(HTTPParser httpParser) async {
    final socket = await _getSocket();
    socket.write(httpParser.build());
    await socket.flush();
  }
}

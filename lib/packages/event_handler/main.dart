import 'package:axolotl/packages/http_parser/main.dart';

class EventHandler {
  final _handlers = <String, void Function(HTTPParser response)>{};

  void add(String key, void Function(HTTPParser response) callback) {
    _handlers[key] = callback;
  }

  void call(String key, HTTPParser response) {
    if (!_handlers.containsKey(key)) return;
    _handlers[key]!(response);
    _handlers.remove(key);
  }
}

import 'package:axolotl/packages/http_parser/methods.enum.dart';
import 'package:uuid/uuid.dart';

class HTTPParser {
  HTTPParser(this.method, this.url, {this.body = '', this.headers = const {}})
      : assert(url.startsWith('/'));

  factory HTTPParser.fromResponse(Methods method, String url,
      {String body = '', Map<String, String> headers = const {}}) {
    return HTTPParser(method, '/$url', body: body, headers: headers);
  }

  factory HTTPParser.fromString(String payload) {
    payload = payload.trim();
    final requestLineHeadersANDBody = payload.split('\x0A');
    final requestLine = requestLineHeadersANDBody[0].split(' ');
    final method = requestLine[0];
    final url = requestLine[1];
    final indexBreaker = requestLineHeadersANDBody
        .indexWhere((element) => element.trim().isEmpty);
    if (indexBreaker == -1) {
      final headersList = requestLineHeadersANDBody.sublist(1);
      final headersIterable =
          headersList.map<MapEntry<String, String>>((headerRaw) {
        final pivot = headerRaw.indexOf(':');
        final key = headerRaw.substring(0, pivot).trim();
        final value = headerRaw.substring(pivot + 1).trim();
        return MapEntry(key, value);
      });
      final headers = <String, String>{}..addEntries(headersIterable);
      return HTTPParser.fromResponse(
          MethodsExtension.stringToMethod(method), url,
          headers: headers);
    }
    final headersList = requestLineHeadersANDBody.sublist(1, indexBreaker);
    final headersIterable =
        headersList.map<MapEntry<String, String>>((headerRaw) {
      final pivot = headerRaw.indexOf(':');
      final key = headerRaw.substring(0, pivot).trim();
      final value = headerRaw.substring(pivot + 1).trim();
      return MapEntry(key, value);
    });
    final headers = <String, String>{}..addEntries(headersIterable);
    final body = requestLineHeadersANDBody.sublist(indexBreaker + 1).join();
    return HTTPParser.fromResponse(MethodsExtension.stringToMethod(method), url,
        headers: headers, body: body);
  }

  final http = 'HTTP/1.0';
  final Methods method;
  final String url;
  final String body;
  final Map<String, String> headers;

  static HTTPParser get(String url, {String body = ''}) {
    final id = const Uuid().v4();
    return HTTPParser(Methods.GET, url,
        body: body, headers: {'X-Reference-Id': id});
  }

  String build() {
    final stringBuilder = StringBuffer();
    stringBuilder.write([method.name, url, http].join(' '));
    stringBuilder.write('\x0A');
    final headersStrings = headers.entries
        .map<String>((entry) => '${entry.key}: ${entry.value}')
        .toList();
    if (headersStrings.isNotEmpty) {
      stringBuilder.write(headersStrings.join('\x0A'));
    }
    if (body.isNotEmpty) {
      stringBuilder.write('\x0A\x0A');
      stringBuilder.write(body);
    }
    stringBuilder.write('\x0A\x0A');
    return stringBuilder.toString();
  }

  @override
  String toString() {
    return build();
  }
}

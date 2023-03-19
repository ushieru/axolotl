import 'package:axolotl/packages/http_parser/utils/bytes.dart';

class ChunkParse {
  ChunkParse(this._payload);

  final String _payload;

  String build() {
    final payloadList = _payload.split(CR);
    final filter = payloadList
        .asMap()
        .entries
        .where((chunkMapEntry) => chunkMapEntry.key % 2 == 1)
        .map<String>((chunkMapEntry) => chunkMapEntry.value);
    return filter.join('');
  }
}

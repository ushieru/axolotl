class Image {
  Image(
      this.id,
      this.parentId,
      this.repoTags,
      this.repoDigests,
      this.created,
      this.size,
      this.sharedSize,
      this.virtualSize,
      this.labels,
      this.containers,
      this.names,
      this.digest,
      this.history);

  factory Image.fromJson(dynamic json) {
    final id = json['Id'];
    final parentId = json['ParentId'];
    final repoTags = List<String>.from(json['RepoTags'] ?? []);
    final repoDigests = List<String>.from(json['RepoDigests'] ?? []);
    final created = json['Created'];
    final size = json['Size'];
    final sharedSize = json['SharedSize'];
    final virtualSize = json['VirtualSize'];
    final labels = json['Labels'];
    final containers = json['Containers'];
    final names = List<String>.from(json['Names'] ?? []);
    final digest = json['Digest'];
    final history = List<String>.from(json['History'] ?? []);
    return Image(id, parentId, repoTags, repoDigests, created, size, sharedSize,
        virtualSize, labels, containers, names, digest, history);
  }

  String id;
  String parentId;
  List<String> repoTags;
  List<String> repoDigests;
  int created;
  int size;
  int sharedSize;
  int virtualSize;
  dynamic labels;
  int containers;
  List<String> names;
  String digest;
  List<String> history;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['ParentId'] = parentId;
    map['RepoTags'] = repoTags;
    map['RepoDigests'] = repoDigests;
    map['Created'] = created;
    map['Size'] = size;
    map['SharedSize'] = sharedSize;
    map['VirtualSize'] = virtualSize;
    map['Labels'] = labels;
    map['Containers'] = containers;
    map['Names'] = names;
    map['Digest'] = digest;
    map['History'] = history;
    return map;
  }

  String get shortName => names.first.split(':').first;

  String get shortTag => names.first.split(':').last;

  String get shortId => id.split(':').last.substring(0, 12);

  bool get isActive => containers > 0;

  @override
  String toString() {
    return 'Image(${toJson()})';
  }
}

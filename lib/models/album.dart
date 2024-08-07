class Album {
  String name;
  String artist;
  String coverUrl;
  String id;
  String statistic;

  Album({
    required this.name,
    required this.artist,
    required this.coverUrl,
    required this.id,
    required this.statistic
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['title'],
      artist: json['uname'],
      coverUrl: json['cover'],
      id: json['menuid'],
      statistic: json['statistic']
    );
  }
}
class Tracks {
  final String id;
  final String title;
  final String thumbnailUrl;
  Tracks({this.id, this.title, this.thumbnailUrl});
  factory Tracks.fromMap(Map<String, dynamic> snippet) {
    return Tracks(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
    );
  }
}

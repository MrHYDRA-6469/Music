class AlbumItems {
  final String id;
  final String title;
  final String thumbnailUrl;
  AlbumItems({this.id, this.title, this.thumbnailUrl});
  factory AlbumItems.fromMap(Map<String, dynamic> snippet) {
    return AlbumItems(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
    );
  }
}

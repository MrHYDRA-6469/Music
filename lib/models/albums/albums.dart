import 'package:music_for_everone/models/albums/tracks.dart';

class Album {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String trackCount;
  List<Tracks> tracks;
  Album({this.id, this.title, this.thumbnailUrl, this.trackCount, this.tracks});
  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'],
      title: map['snippet']['title'],
      thumbnailUrl: map['snippet']['thumbnails']['default']['url'],
      trackCount: map['statistics']['videoCount'],
    );
  }
}

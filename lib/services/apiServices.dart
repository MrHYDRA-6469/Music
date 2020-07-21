import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:music_for_everone/models/albums/albums.dart';
import 'dart:io';

String url = 'https://api.spotify.com/v1/browse/new-releases';

Future<Albums> getAlbum() async {
  final response = await http.get(url);
  return albumsFromJson(response.body);
}

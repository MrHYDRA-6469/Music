import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:music_for_everone/models/albums/albums.dart';
import 'dart:io';
import 'dart:convert';
import 'package:music_for_everone/utilities/key.dart';

String url =
    'https://api.spotify.com/v1/artists/45PG2L6Fh2XvYL4ONzpdoW/top-tracks?country=in';

Future<Albums> getAlbum() async {
  final response = await http.get(
    url,
    headers: {HttpHeaders.authorizationHeader: API_KEY},
  );
  final responseJson = json.decode(response.body);

  return Albums.fromJson(responseJson);
}
// class APIService {
//   APIService._instantiate();
//   static final APIService instance = APIService._instantiate();

// }

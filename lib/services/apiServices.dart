import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:music_for_everone/models/albums/albums.dart';
import 'dart:io';
import 'dart:convert';
import 'package:music_for_everone/utilities/key.dart';
// import 'package:oauth2/oauth2.dart';

String url = '	https://api.spotify.com/v1/browse/new-releases';

Future<Albums> fetchAlbum() async {
  final response = await http.get(
    url,
    // headers: {HttpHeaders.authorizationHeader: API_KEY},
  );
  if (response.statusCode == 200) {
    return Albums.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
// class APIService {
//   APIService._instantiate();
//   static final APIService instance = APIService._instantiate();

// }

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:music_for_everone/models/albums/albums.dart';
import 'dart:io';
import 'dart:convert';
import 'package:music_for_everone/utilities/key.dart';
// import 'package:oauth2/oauth2.dart';

String url = '	https://api.spotify.com/v1/browse/new-releases';

Future<Albums> fetchAlbum() async {
  Map<String, String> parameters = {
    'country': null,
    'limit': null,
    'offset': null,
  };
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        "BQBX4UufRxqBeWa6PoGPS_IGtyuhELsPhaMrIwfxG1B0aRNzA7iCvMskgKKNuElZ-q3BvqJsZliygKnxNvFQ7w8WUDfkKhwMNp6d0Fga6zgqkJGnP3gknkbfpKDEYK1P7hFeAD1liWNsWi0W-2Qpe0vBFZjlWh9BCXLH-DrY9O74-JgwFm6_SgYxuH8r-xnLfDBqWHn1XVfbnf9Taa14ANNngyNgJZBKiKxDDnCVGS1P9xtkEg25_sPq4c8lHy7JQCzL1Yhm1d8c2u7sVJoPPnU_LW4LuTuiYmym",
  };
  final response = await http.get(
    url,
    headers: headers,
  );
  print(json.decode(response.body));
  if (response.statusCode == 200) {
    print('success response');
    return Albums.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
// class APIService {
//   APIService._instantiate();
//   static final APIService instance = APIService._instantiate();

// }

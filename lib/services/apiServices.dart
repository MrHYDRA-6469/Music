import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:music_for_everone/models/albums/albums.dart';
import 'dart:io';
import 'dart:convert';
import 'package:music_for_everone/utilities/key.dart';
// import 'package:oauth2/oauth2.dart';

String url = 'https://api.spotify.com/v1/browse/new-releases';

Future<Albums> fetchAlbum() async {
  Map<String, String> parameters = {
    'country': null,
    'limit': null,
    'offset': null,
  };
  Map<String, String> headers = {
    // HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ' +
        "BQDHl0HXQEyUZfBsXcyP2yrKHrP9TJgIlpehobZiSHL14YSTIzyGblumvKb8bK7mrbs_-AIQUTBXtK2OhSukemAmU3VoJkqQYr-2-_fwbmyfh6eHvZRIJQy500PNgqpwpffZ648-8YmjbouEbr4aKWESEI25cQrDq_oUvTVUjXJnm3cACix8cAhSrz6UVt32FJKkWXGakZP7JjO-jxRkRGH813ixe9gwrpYyv5bzhL_wixEHaYQ5ZXRyEG-r__mchoTslfdHUSR9dCYPS0dXfBoCDZp5KFxH",
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

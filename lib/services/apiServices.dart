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
        "BQB9ckIz2cUZaIAHN5S361ooeXzdyz80OMJKF6LQwHrkJ1x8ueuJBtpOE_Lei-xZukXok0aYMaNzfu8e47G4s4y5WsR3L87p0BjeFmZ_aZZl0g0uAxh5j9WU0W6JyHyQZUPlLDs3abo-AqDSDWgC3LBZvaysQu-jJXqhjQZz4LIlBTZLSI9iy3BXJjM9gQOwU3sj-pNC0Ar_nZ8ubXz4seqtnUI8k_WPuZAt-WxsHn_WRhQXsesrjTdBcPETu-jC17yjlrhJhKl5zXj8Dyw7lTdl2WM5AbfAMkPS",
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

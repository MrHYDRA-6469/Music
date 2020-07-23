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
        "BQD2ce30fH1Sa4oFwWKqewgyd_TF8_FcjsmhSaaHTBSX7gdY9yus1IKQzQRz3ZqqNwLgkb00tDu0e6bbHDeYxSiORVNuj7ITTbWhYAaIYxqtRw2g8hlcO1WDsFVfYddNF59RskprComuPLse6MNug27r0BxCIlcSfVG2fbyTsCp8cNs1FrH-gej-Qdm70NrERwmQV1p6DatUs3MS-TU0l4baE6wn6ocCLrEbKe8dcWY9iR4SjxzbPR61KQ9khPsuDGa8G4XsX28UyBnsMNkUaqiojy3XjuqojS5Q",
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

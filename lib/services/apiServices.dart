import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:music_for_everone/models/albums/albums.dart';
import 'dart:io';
import 'dart:convert';

// import 'package:oauth2/oauth2.dart';

String url = 'https://api.spotify.com/v1/browse/new-releases';

Future<String> getAuthToken() async {
  // final String clientID = DotEnv().env['CLIENTID'];
  // final String clientSecret = DotEnv().env['CLIENTSECRET'];
  final String credentials = '' + ':' + '';
  String base64encoded = base64Url.encode(utf8.encode(credentials));

  var url = 'https://accounts.spotify.com/api/token';
  var response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Basic ' + base64encoded,
    },
    body: {'grant_type': 'client_credentials'},
  );

  Map<String, dynamic> tokenJSON = jsonDecode(response.body);
  print(jsonDecode(response.body));
  return tokenJSON['access_token'];
}

Future<Albums> fetchAlbum() async {
  final String accode = await getAuthToken();
  print('accode1');
  print(accode);

  print('accode2');
  Map<String, String> parameters = {
    'country': null,
    'limit': null,
    'offset': null,
  };
  Map<String, String> headers = {
    // HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ' + accode
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

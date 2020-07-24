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
        "BQAJoMXiB2oQ9hk0ByFu0sN1bI8jcFE8CBkhCpXoeJ-Tn2MqLQePv6XoojYl6NPbhyG4QNbSuL5kUqAUkp3irM7o1YEuPLkkvrg0TBFpqarX8Z2IWA9fiSVMhmoH2UBvzLVDSXu80K8_Qo9X6zcoKIsintxZB_DnnyzfVRYGkUQtGH8qs4w-LEn8OOhazjcSmyyGS8eheF0E5RKmPWXrYXYvKL5L5v0DpvrUGG9rakW3FQz2yh9Zt7qU8C2TG4V9PstXn6kfn_IfLXXVMqjCelYgssgVqWMDYHEf",
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

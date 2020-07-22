import 'package:flutter/material.dart';
import 'package:music_for_everone/models/albums/albums.dart';
import 'package:music_for_everone/services/apiServices.dart';

class Library extends StatelessWidget {
  get controller => null;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            FutureBuilder<Albums>(
              future: getAlbum(),
              builder: (context, snapshot) {
                return snapshot.data.albums != null
                    ? Text('has data')
                    : Text('got null');
              },
            ),
          ],
        ),
      ),
    );
  }
}

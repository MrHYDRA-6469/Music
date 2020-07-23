import 'package:flutter/material.dart';
import 'package:music_for_everone/models/albums/albums.dart';
import 'package:music_for_everone/services/apiServices.dart';

class Library extends StatelessWidget {
  get controller => null;

  Widget build(BuildContext context) {
    print('time 111111111');
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            FutureBuilder<Albums>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                print('Inside 222222222');
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

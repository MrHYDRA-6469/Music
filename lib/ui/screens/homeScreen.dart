// import 'package:flute_music_player/flute_music_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_for_everone/ui/screens/library.dart';
import 'package:music_for_everone/ui/screens/mainpage.dart';
import 'package:music_for_everone/ui/screens/serach.dart';
import 'package:music_for_everone/ui/widgets/player.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  Widget nextScreen(int index) {
    switch (index) {
      case 0:
        return MainPage();
        break;
      case 1:
        return Search();
        break;
      case 2:
        return Library();
        break;
      // case 3:
      //   return Premium();
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nextScreen(index),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[900],
          ),
          child: BottomNavigationBar(
              currentIndex: index,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.white54,
              selectedItemColor: Colors.white,
              onTap: ((int x) {
                setState(() {
                  index = x;
                  nextScreen(index);
                });
              }),
              type: BottomNavigationBarType.fixed,
              items: [
                new BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Search'),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(Icons.library_music),
                  title: Text('Your Library'),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.spotify),
                  title: Text('Premium'),
                ),
              ])),
    );
  }
}

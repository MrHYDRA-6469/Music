// import 'package:flute_music_player/flute_music_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  bool isPlaying = false;
  bool loopEnable = false;
  bool shuffleEnable = false;
  String current_time = '00.00';
  String end_time = '00.00';
  @override
  void initState() {
    super.initState();
    advancedPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        current_time = duration.toString().split(".")[0];
      });
    });
    advancedPlayer.onDurationChanged.listen((Duration duration) {
      end_time = duration.toString().split(".")[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.library_music,
            color: Colors.black,
          ),
          onPressed: () async {
            String filePath = await FilePicker.getFilePath();
            int status = await advancedPlayer.play(filePath, isLocal: true);
            if (status == 1) {
              setState(() {
                isPlaying = true;
              });
            }
          },
        ),
        title: Text(
          'Custom Music Player',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text(
              current_time,
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                if (isPlaying) {
                  advancedPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  advancedPlayer.resume();
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
            ),
            IconButton(
                icon: Icon(Icons.stop),
                onPressed: () {
                  advancedPlayer.stop();
                  setState(() {
                    current_time = '00.00';
                    isPlaying = false;
                  });
                }),
            IconButton(
                color: loopEnable ? Colors.black : Colors.grey,
                icon: Icon(Icons.loop),
                onPressed: () {
                  setState(() {
                    loopEnable = !loopEnable;
                  });
                }),
            IconButton(
              color: shuffleEnable ? Colors.black : Colors.grey,
              icon: Icon(Icons.shuffle),
              onPressed: () {
                setState(() {
                  shuffleEnable = !shuffleEnable;
                });
              },
            ),
            Spacer(),
            Text(
              end_time,
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

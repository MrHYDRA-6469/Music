import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
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
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    color: loopEnable ? Colors.black : Colors.grey,
                    icon: Icon(Icons.loop),
                    onPressed: () {
                      setState(() {
                        loopEnable = !loopEnable;
                      });
                    }),
                IconButton(
                    iconSize: 40,
                    color: Colors.black,
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {}),
                IconButton(
                  iconSize: 60,
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
                    iconSize: 40,
                    color: Colors.black,
                    icon: Icon(Icons.skip_next),
                    onPressed: () {}),
                // IconButton(
                //     icon: Icon(Icons.stop),
                //     onPressed: () {
                //       advancedPlayer.stop();
                //       setState(() {
                //         current_time = '00.00';
                //         isPlaying = false;
                //       });
                //     }),
                IconButton(
                  color: shuffleEnable ? Colors.black : Colors.grey,
                  icon: Icon(Icons.shuffle),
                  onPressed: () {
                    setState(() {
                      shuffleEnable = !shuffleEnable;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text(
                  current_time,
                  style: TextStyle(color: Colors.black),
                ),
                Spacer(),
                Text(
                  end_time,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

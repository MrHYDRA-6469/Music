import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';
  String inputText = '';

  bool selecTrack = false;
  bool selectArtist = false;
  bool selectAlbum = false;
  bool selectPlaylist = false;
  bool selectShow = false;
  bool selectEpisode = false;

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(40, 96, 65, 7.0),
          Color(0xFF191414),
        ], begin: Alignment.topLeft, end: FractionalOffset(0.5, 0.5)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            Container(
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white.withOpacity(1.0),
                  fontFamily: 'SpotifyFont',
                  fontSize: 50.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      validator: (val) =>
                          val.isEmpty ? 'Enter something' : null,
                      onChanged: (val) {
                        inputText = val;
                      },
                    ),
                  ),
                  IconButton(
                      iconSize: 35,
                      splashColor: Colors.greenAccent,
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          query = "name:$inputText&type=album,artist,track";
                          print(query);
                        });
                      })
                ],
              ),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Chip(
                        shadowColor: Colors.greenAccent,
                        label: Text(
                          'Filters',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'SpotifyFont'),
                        ),
                        backgroundColor: Color(0xff006400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ActionChip(
                          shadowColor: Colors.greenAccent,
                          label: Text(
                            'track',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'SpotifyFont'),
                          ),
                          backgroundColor:
                              selecTrack ? Color(0xff006400) : Color(0x162F23),
                          onPressed: () {
                            setState(() {
                              selecTrack = !selecTrack;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      ActionChip(
                          shadowColor: Colors.greenAccent,
                          label: Text(
                            'artist',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'SpotifyFont'),
                          ),
                          backgroundColor: selectArtist
                              ? Color(0xff006400)
                              : Color(0x162F23),
                          onPressed: () {
                            setState(() {
                              selectArtist = !selectArtist;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      ActionChip(
                          shadowColor: Colors.greenAccent,
                          label: Text(
                            'playlist',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'SpotifyFont'),
                          ),
                          backgroundColor: selectPlaylist
                              ? Color(0xff006400)
                              : Color(0x162F23),
                          onPressed: () {
                            setState(() {
                              selectPlaylist = !selectPlaylist;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      ActionChip(
                          shadowColor: Colors.greenAccent,
                          label: Text(
                            'album',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'SpotifyFont'),
                          ),
                          backgroundColor:
                              selectAlbum ? Color(0xff006400) : Color(0x162F23),
                          onPressed: () {
                            setState(() {
                              selectAlbum = !selectAlbum;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      ActionChip(
                          shadowColor: Colors.greenAccent,
                          label: Text(
                            'show',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'SpotifyFont'),
                          ),
                          backgroundColor:
                              selectShow ? Color(0xff006400) : Color(0x162F23),
                          onPressed: () {
                            setState(() {
                              selectShow = !selectShow;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      ActionChip(
                          shadowColor: Colors.greenAccent,
                          label: Text(
                            'episode',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'SpotifyFont'),
                          ),
                          backgroundColor: selectEpisode
                              ? Color(0xff006400)
                              : Color(0x162F23),
                          onPressed: () {
                            setState(() {
                              selectEpisode = !selectEpisode;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recent Search',
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'SpotifyFont'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/albums/albums.dart';
import '../../models/albums/albums.dart';
import '../../services/apiServices.dart';
import '../../services/apiServices.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget projectWidget() {
    return FutureBuilder(
      future: fetchAlbum(),
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return ListView.builder(
          itemCount: projectSnap.data.albums.items.length,
          itemBuilder: (context, index) {
            Albums project = projectSnap.data[index];
            return Column(
              children: <Widget>[
                Image(
                    image: NetworkImage(project.albums.items[6].images[2].url))
                // Widget to display the list of project
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(40, 96, 65, 7.0),
          Color(0xFF191414),
        ], begin: Alignment.topLeft, end: FractionalOffset(0.5, 0.5)),
      ),
      child: Container(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(45.0),
                  ),
                  Container(
                    height: 250.0,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Recently Played',
                          style: TextStyle(
                              color: Colors.white.withOpacity(1.0),
                              fontSize: 18.0,
                              fontFamily: 'SpotifyFont',
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Container(
                          child: FutureBuilder(
                            future: fetchAlbum(),
                            builder: (context, projectSnap) {
                              if (projectSnap.connectionState ==
                                      ConnectionState.none &&
                                  projectSnap.hasData == null) {
                                //print('project snapshot data is: ${projectSnap.data}');
                                return Container();
                              } else if (projectSnap.data != null) {
                                return Container(
                                  height: 200,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: projectSnap
                                        .data.albums.items[1].artists.length,
                                    itemBuilder: (context, index) {
                                      Albums project = projectSnap
                                          .data.albums.items[1].artists[index];
                                      return Column(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(project.albums.items[1]
                                                .artists[3].name),
                                            // child: Image(
                                            //     image: NetworkImage(project.albums
                                            //         .items[6].images[2].url)),
                                          )
                                          // Widget to display the list of project
                                        ],
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator(); // loading
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 290.0,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Made for you',
                          style: TextStyle(
                              color: Colors.white.withOpacity(1.0),
                              fontSize: 18.0,
                              fontFamily: 'SpotifyFont',
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: FutureBuilder<Albums>(
                            future: fetchAlbum(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Expanded(
                                  child: Image(
                                      image: NetworkImage(snapshot
                                          .data.albums.items[6].images[1].url)),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }

                              // By default, show a loading spinner.
                              return CircularProgressIndicator();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      'Recommendation',
                      style: TextStyle(
                          color: Colors.white.withOpacity(1.0),
                          fontSize: 23.0,
                          fontFamily: 'SpotifyFont',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// height: 165.0,
//                         child: ListView.builder(
//                           itemCount: 10,
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Column(
//                               children: <Widget>[
//                                 SizedBox(
//                                   height: 130.0,
//                                   width: 140.0,
//                                   child: Image.asset(
//                                     '',
//                                     fit: BoxFit.fitHeight,
//                                   ),
//                                 ),
//                                 Padding(padding: EdgeInsets.all(5.0)),
//                                 Text(
//                                   '..........',
//                                   style: TextStyle(
//                                     color: Colors.white.withOpacity(1.0),
//                                     fontFamily: 'SpotifyFont',
//                                     fontSize: 10.0,
//                                   ),
//                                 )
//                               ],
//                             );
//                           },
//                         ),

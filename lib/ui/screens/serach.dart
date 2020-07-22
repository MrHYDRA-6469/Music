import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  String query = '';
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF414345),
          Color(0xFF000000),
        ], begin: Alignment.topLeft, end: FractionalOffset(0.2, 0.7)),
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
                        query = val;
                      },
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: null)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

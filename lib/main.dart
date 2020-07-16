import 'package:flutter/material.dart';
import 'package:music_for_everone/services/loggedIn.dart';
import 'package:music_for_everone/ui/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoggedIn());
  }
}

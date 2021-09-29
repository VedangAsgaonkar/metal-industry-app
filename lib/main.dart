import 'package:flutter/material.dart';
import 'package:stockclone/pages/homePage.dart';
import 'package:stockclone/pages/explorePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context)=>HomePage(),
        'explore' : (context)=>ExplorePage(),
      },
    );
  }
}

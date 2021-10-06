import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stockclone/pages/homePage.dart';
import 'package:stockclone/pages/explorePage.dart';
import 'package:stockclone/pages/login.dart';

Future<void> main() async {
  // added a future
  // next 2 lines were added
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => PhoneAuthPage(),
        'explore': (context) => ExplorePage(),
      },
    );
  }
}


//remember
// '/': (context) => HomePage(),

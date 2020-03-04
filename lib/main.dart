import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:photo_pos/bootstrap/bootstrap.dart';
import 'package:photo_pos/screens/screens.dart';

GetIt sl = GetIt.I;

void main() {
  bootstrapApp(sl);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: sl.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AppLoadingScreen();
          } else {
            return HomeScreen();
          }
        },
      ),
    );
  }
}

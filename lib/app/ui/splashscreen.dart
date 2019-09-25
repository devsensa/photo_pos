import 'dart:async';

import 'package:flutter/widgets.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final StreamController<int> _strm = StreamController();
  Stream<int> get strm => _strm.stream;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    _strm.close();
  }
}

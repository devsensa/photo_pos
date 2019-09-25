import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_pos/initialize_app.dart';

void main() => runApp(InitializeApp(PhotoPosApp()));

class PhotoPosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: CupertinoPageScaffold(
        child: Center(
          child: RaisedButton(
            child: Text(""),
            onPressed: () async {},
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraTest extends StatefulWidget {
  final CameraDescription camera;

  const CameraTest({Key key, @required this.camera}) : super(key: key);

  @override
  _CameraTestState createState() => _CameraTestState();
}

class _CameraTestState extends State<CameraTest> {
  CameraController _cameraController;
  Future<void> _initCamController;
  Optional<String> _imgPath = Optional.empty();

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);
    _initCamController = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test background camera"),
      ),
      body: FutureBuilder(
        future: _initCamController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: Center(
                child: _imgPath.isPresent
                    ? PhotoPreview(imgPath: _imgPath.value)
                    : Text("Waiting photo"),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          await _initCamController;
          final path = join(
            (await getTemporaryDirectory()).path,
            "${DateTime.now().toIso8601String()}.png",
          );
          await _cameraController.takePicture(path);
          setState(() {
            _imgPath = Optional.of(path);
          });
        },
      ),
    );
  }
}

class PhotoPreview extends StatelessWidget {
  final String imgPath;

  const PhotoPreview({Key key, this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(File(imgPath));
  }
}

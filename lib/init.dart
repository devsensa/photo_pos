import 'package:camera/camera.dart';

//
//Future<void> init() async {
//  var c = kiwi.Container();
//
//  final frontCamera = (await availableCameras()).firstWhere((cam) {
//    return cam.lensDirection.index == CameraLensDirection.front.index;
//  });
//
//  final backCamera = (await availableCameras()).firstWhere((cam) {
//    return cam.lensDirection.index == CameraLensDirection.back.index;
//  });
//
//  c.registerSingleton((c) => frontCamera, name: "front-camera");
//  c.registerSingleton((c) => backCamera, name: "back-camera");
//}

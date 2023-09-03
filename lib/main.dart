import 'package:camera/camera.dart';
import 'package:fimh_app/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: DashboardPage(
      camera: cameras.first,
    ),
  ));
}

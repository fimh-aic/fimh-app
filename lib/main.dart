import 'package:camera/camera.dart';
import 'package:fimh_app/presentation/pages/dashboard.dart';
import 'package:fimh_app/utils/injection/injection_container.dart' as di;
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpLocator();

  cameras = await availableCameras();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: DashboardPage(
      camera: cameras.first,
    ),
  ));
}

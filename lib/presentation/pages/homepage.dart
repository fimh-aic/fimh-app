import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fimh_app/presentation/pages/detail.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/food_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController controller;
  late Future<void> initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await initializeControllerFuture;
            final image = await controller.takePicture();

            if (!mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Picture')),
      body: Center(
          child: Column(
        children: [
          Image.file(File(imagePath)),
          const SizedBox(height: 16),
          TextButton(
              onPressed: () {
                print("Kirim gambar");
                // kirim ke API lalu navigator push
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(
                          food: FoodEntity(
                            name: "Apple",
                            calories: 53,
                            servingSize: 100,
                            fatTotal: 0.2,
                            fatSaturated: 0,
                            protein: 0.3,
                            sodium: 1,
                            potassium: 11,
                            cholesterol: 0,
                            carbohydrates: 14.1,
                            fiber: 2.4,
                            sugar: 10.3,
                          ),
                          imagePath: imagePath,
                        )));
              },
              child: const Text("Cari gambar")),
        ],
      )),
    );
  }
}

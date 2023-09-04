import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fimh_app/domain/entity/food_recognition_entity.dart';
import 'package:fimh_app/domain/usecase/get_food_name.dart';
import 'package:flutter/material.dart';

import '../../utils/injection/injection_container.dart';
import 'detail.dart';

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
class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final GetFoodName getFoodName = sl<GetFoodName>();

  bool isSend = false;
  bool isLoading = false;
  bool isError = false;
  FoodRecognitionEntity? food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Picture')),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 350,
            child: Image.file(File(widget.imagePath)),
          ),
          const SizedBox(height: 16),
          // show circular indicator when loading submission
          if (isSend && isLoading)
            const CircularProgressIndicator()
          else
            const SizedBox(height: 16),

          if (!isSend && !isLoading && !isError)
            TextButton(
              onPressed: () async {
                if (isSend) {
                  return;
                } else {
                  setState(() {
                    isSend = true;
                    isLoading = true;
                  });
                }

                final res = await getFoodName(
                    FoodImageParams(imagePath: widget.imagePath));

                res.fold(
                  (l) {
                    // print(l.toString());
                    setState(() {
                      isError = true;
                    });
                  },
                  (r) {
                    setState(() {
                      isError = false;
                      food = r;
                    });
                    // print(
                    // "Name: ${food!.name}; confidence: ${food!.confidence}");
                  },
                );
                setState(() {
                  isLoading = false;
                });
              },
              child: const Text("Search"),
            ),
          if (isSend && !isLoading && isError) const Text("Error"),
          if (isSend && !isLoading && !isError && food != null)
            Column(
              children: [
                Text("Name: ${food!.name}"),
                Text("Confidence: ${food!.confidence}"),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            food: food!.nutrition,
                            imagePath: widget.imagePath,
                          ),
                        ),
                      );
                    },
                    child: const Text("Find Nutrition"))
              ],
            ),
        ],
      )),
    );
  }
}

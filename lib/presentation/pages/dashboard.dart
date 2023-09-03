import 'package:camera/camera.dart';
import 'package:fimh_app/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.camera});

  final String title = "FIMH App";
  final CameraDescription camera;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isDiet = false;
  bool isLactoseIntolerant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Hello, please select your profil preference',
            ),
            Row(
              children: [
                Checkbox(
                  value: isDiet,
                  onChanged: (value) {
                    print("change is diet");
                    setState(() {
                      isDiet = value!;
                    });
                  },
                ),
                const Text("I am in a diet program")
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isLactoseIntolerant,
                  onChanged: (value) {
                    print("change is lactose intolerant");
                    setState(() {
                      isLactoseIntolerant = value!;
                    });
                  },
                ),
                const Text("I am lactose intolerant")
              ],
            ),
            const SizedBox(height: 20),
            const Text("Select menu:"),
            TextButton(
              onPressed: () async {
                print("open camera");
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(camera: widget.camera),
                  ),
                );
              },
              child: const Text("Take a Picture"),
            ),
            TextButton(
                onPressed: () async {
                  print("open search page");
                },
                child: const Text("Search")),
          ],
        ),
      ),
    );
  }
}

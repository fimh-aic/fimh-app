import 'package:camera/camera.dart';
import 'package:fimh_app/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.camera});

  final String title = "NUTRIKU";
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
            const Text("Welcome to", style: TextStyle(fontSize: 20)),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("NUTRIKU",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text('Please select your profil preference',
                  style: TextStyle(fontSize: 16)),
            ),
            Row(
              children: [
                Checkbox(
                  value: isDiet,
                  onChanged: (value) {
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
                    setState(() {
                      isLactoseIntolerant = value!;
                    });
                  },
                ),
                const Text("I am lactose intolerant")
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Let's Find Your Food Nutritions",
                  style: TextStyle(fontSize: 20)),
            ),
            TextButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(camera: widget.camera),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text("Take a Picture")),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:fimh_app/domain/entity/food_entity.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String imagePath;
  final FoodEntity food;

  const DetailPage({super.key, required this.food, required this.imagePath});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final FoodEntity food = widget.food;
    final String imagePath = widget.imagePath;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kandungan Nutrisi"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.file(File(imagePath)),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(food.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Total Kalori: ${food.calories} cal"),
                Text("Penyajian: ${food.servingSize} cal"),
                Text("Karbohidrat: ${food.carbohydrates} g"),
                Text("Total Lemak: ${food.fatTotal} g"),
                Text("Lemak Jenuh: ${food.fatSaturated} g"),
                Text("Gula: ${food.sugar} g"),
                Text("Protein: ${food.protein} g"),
                Text("Sodium: ${food.sodium} mg"),
                Text("Potassium: ${food.potassium} mg"),
                Text("Zat Besi: ${food.fiber} g"),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Rekomendasi resep:"),
          ],
        ),
      ),
    );
  }
}

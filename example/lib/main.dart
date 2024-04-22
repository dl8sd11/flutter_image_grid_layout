import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_grid/image_grid.dart';

void main() {
  runApp(const MainApp());
}

List<String> getImageList(int n) {
  List<String> imageList = [];
  var random = Random();
  int height = 600;
  int width = 400;
  for (int i = 0; i < n; i++) {
    int seed = random.nextInt(10000);
    if (seed % 2 == 0) {
      imageList.add('https://picsum.photos/seed/$seed/$height/$width');
    } else {
      imageList.add('https://picsum.photos/seed/$seed/$width/$height');
    }
  }
  return imageList;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ImageGrid(
            images: getImageList(100)
                .map((e) => Image.network(
                      e,
                      fit: BoxFit.fill,
                    ))
                .toList(),
            minItemPerRow: 3,
            maxItemPerRow: 4,
          ),
        ),
      ),
    );
  }
}

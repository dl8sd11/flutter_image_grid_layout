library image_grid;

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_grid/image_row.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({
    super.key,
    required this.images,
    this.minItemPerRow = 2,
    this.maxItemPerRow = 3,
  });

  final List<Image> images;
  final int minItemPerRow;
  final int maxItemPerRow;

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    int count = 0;
    var random = Random();
    while (count < images.length) {
      var takes = min(images.length - count, random.nextInt(2) + 2);
      rows.add(ImageRow(images: images.sublist(count, count + takes)));
      count += takes;
    }
    return ListView(children: rows);
  }
}

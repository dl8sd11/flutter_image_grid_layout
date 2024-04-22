import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ImageRow extends StatelessWidget {
  const ImageRow({
    super.key,
    required this.images,
  });

  final Iterable<Image> images;

  @override
  Widget build(BuildContext context) {
    Future<List<ui.Image>> imageInfo = getImageInfo();

    return FutureBuilder(
        future: imageInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> sizedImages = getSizedImages(
                snapshot.data!, MediaQuery.of(context).size.width);

            return Column(
              children: [
                Row(
                  children: sizedImages,
                )
              ],
            );
          } else {
            return Container();
          }
        });
  }

  List<Widget> getSizedImages(List<ui.Image> imageInfoList, double maxWidth) {
    double widthSum = 0;
    double targetHeight = imageInfoList[0].height.toDouble();
    for (var info in imageInfoList) {
      widthSum += targetHeight * info.width / info.height;
    }
    double widthScale = maxWidth / widthSum;

    List<Widget> sizedImages = [];
    int imageIndex = 0;
    for (final image in images) {
      int origWidth = imageInfoList[imageIndex].width;
      int origHeight = imageInfoList[imageIndex].height;
      double scale = targetHeight / origHeight * widthScale;
      sizedImages.add(SizedBox(
          width: origWidth * scale, height: origHeight * scale, child: image));
      imageIndex++;
    }
    return sizedImages;
  }

  Future<List<ui.Image>> getImageInfo() {
    List<Completer<ui.Image>> completers = [];
    for (var image in images) {
      completers.add(Completer<ui.Image>());
      final last = completers.last;
      image.image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
              (ImageInfo info, bool _) => last.complete(info.image)));
    }
    return Future.wait(completers.map((e) => e.future));
  }
}

# Image Grid

A simple flutter widget that displays Image widgets in a lively layout.

<p float="left">
    <img src="https://github.com/dl8sd11/flutter_image_grid_layout/blob/main/example/repo/phone.png?raw=true" height="400">
    <img src="https://github.com/dl8sd11/flutter_image_grid_layout/blob/main/example/repo/browser.png?row=true" height="400">
</p>


## Features

- Layout a grid of images with varying sizes.
- The images in the same row are scaled to the same height.
- Randomly assign a different number of images to each row.

## Getting started

### Add dependency

```shell
flutter pub add image_grid_layout
```

### Add import package

```dart
flutter pub add image_grid_layout
```

## Usage

Simply pass a `List<Image>` to the `ImageGrid` constructor. Set `BitFit.fill` for the `Image` to enable image stretching.

```dart
ImageGrid(
    images: imageUrls
        .map((e) => Image.network(
                e,
                fit: BoxFit.fill,
            ))
        .toList(),
    minItemPerRow: 2,
    maxItemPerRow: 3,
)
```

Check out the [example](https://github.com/dl8sd11/flutter_image_grid_layout/tree/main/example) for the full demo.

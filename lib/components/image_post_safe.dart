import 'package:facefood/utils/resources.dart';
import 'package:flutter/material.dart';

class ImagePostSafe extends StatelessWidget {
  final String imageUrl;
  ImagePostSafe({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: (imageUrl != null)
          ? NetworkImage(imageUrl)
          : AssetImage(fallbackPostLink),
    );
  }
}

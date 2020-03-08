import 'package:facefood/utils/resources.dart';
import 'package:flutter/material.dart';

class ImagePostSafe extends StatelessWidget {
  final String imgUrl;
  ImagePostSafe({this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: (imgUrl != null)
          ? NetworkImage(imgUrl)
          : AssetImage(fallbackPostLink),
    );
  }
}

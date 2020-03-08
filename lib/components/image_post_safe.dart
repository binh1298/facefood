import 'package:facefood/utils/resources.dart';
import 'package:flutter/material.dart';

class UserImageSafe extends StatelessWidget {
  final String imgUrl;
  UserImageSafe({this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: (imgUrl != null)
          ? NetworkImage(imgUrl)
          : AssetImage(fallbackPostLink),
    );
  }
}

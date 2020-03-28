import 'package:facefood/screens/utils/image_capture.dart';
import 'package:flutter/material.dart';

class UpdateImageComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ImageCaptureScreen(
          label: 'Update Image',
          onSuccess: (url) async {
            print('url: $url');
            Navigator.pop(context, url);
          },
          onFailed: () {
            Navigator.pop(context, null);
          },
        );
      },
    );
  }
}

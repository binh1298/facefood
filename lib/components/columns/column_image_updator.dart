import 'package:facefood/components/buttons/button_full_width.dart';
import 'package:facefood/components/image_post_safe.dart';
import 'package:facefood/style/style.dart';
import 'package:flutter/material.dart';

class ColumnImageUpdator extends StatefulWidget {
  final Function onSuccess;

  ColumnImageUpdator(this.onSuccess);

  @override
  _ColumnImageUpdatorState createState() => _ColumnImageUpdatorState();
}

class _ColumnImageUpdatorState extends State<ColumnImageUpdator> {
  String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonFullWidth(
          label: 'Update Image',
          onPressed: () async {
            final imageUrl = await Navigator.pushNamed(
              context,
              '/updateImage',
            );
            if (imageUrl != null) {
              widget.onSuccess(imageUrl);
              setState(() {
                _imageUrl = imageUrl;
              });
            }
          },
        ),
        SizedBox(height: 10,),
        Container(
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.width * 0.7,
          decoration:
              BoxDecoration(border: Border.all(color: colorTextDefault)),
          child: _imageUrl != null
              ? ImagePostSafe(
                  imageUrl: _imageUrl,
                )
              : Icon(
                  Icons.add_a_photo,
                  size: 100,
                ),
        ),
      ],
    );
  }
}

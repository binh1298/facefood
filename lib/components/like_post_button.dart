import 'package:flutter/material.dart';

class LikePostButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  const LikePostButton({
    Key key,this.color=Colors.grey,this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:onPressed,
      icon: Icon(Icons.favorite,color: color,),
    );
  }
}
import 'package:flutter/material.dart';


class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Color gradientBegin, gradientEnd;


  GradientAppBar({this.title, this.gradientBegin, this.gradientEnd}) :
      assert(title != null),
      assert(gradientBegin != null),
      assert(gradientEnd != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            gradientBegin,
            gradientEnd
          ]
        )
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 10.0,
          fontSize: 30.0,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0);
}
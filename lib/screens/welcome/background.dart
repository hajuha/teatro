import 'package:cinema/constants/color.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: PrimaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.width * 0.1,
            child: Image.asset("assets/image/logo_transparent.png",
                height: size.height * 0.5),
          ),
          child
        ],
      ),
    );
    throw UnimplementedError();
  }
}

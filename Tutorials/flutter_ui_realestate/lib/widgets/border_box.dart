import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const BorderBox({
    Key? key,
    required this.width,
    required this.height,
    required this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          color: COLOR_WHITE,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: COLOR_GREY.withAlpha(40),
            width: 2,
          )),
      child: Center(
        child: child,
      ),
    );
  }
}

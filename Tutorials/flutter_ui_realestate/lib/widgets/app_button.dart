// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/utils/constants.dart';
import 'package:flutter_ui_realestate/utils/widgets.dart';

class AppButton extends StatelessWidget {
  final double width;
  final IconData icon;
  final String text;

  const AppButton(
      {Key? key, required this.width, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: TextButton(
            style: ButtonStyle(
              // overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(COLOR_DARK_BLUE),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: COLOR_WHITE,
                ),
                addHorizontalSpace(10),
                Text(
                  text,
                  style: TextStyle(color: COLOR_WHITE),
                ),
              ],
            )),
      ),
    );
  }
}

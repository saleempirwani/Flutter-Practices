// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/colors/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4caf50),
      body: SafeArea(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    final txt1 = Text(
      'NAME',
      style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
    );

    final txt2 = Text(
      'Saleem Pirwani',
      style: TextStyle(
          color: Colors.amberAccent[200],
          letterSpacing: 2.0,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
    final txt3 = Text(
      'CURRENT NINJA LEVEL',
      style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
    );

    final txt4 = Text(
      '$ninjaLevel',
      style: TextStyle(
          color: Colors.amberAccent[200],
          letterSpacing: 2.0,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );

    final emailText = Text(
      'saleemraza3465@gmail.com',
      style: TextStyle(color: Colors.white),
    );

    final spaceV = SizedBox(height: 10.0);
    final spaceH = SizedBox(width: 10);

    final icon = Icon(
      Icons.email,
      color: Colors.white,
    );

    final avatar = Center(
        child: CircleAvatar(
      radius: 40,
      backgroundImage: NetworkImage(
          'https://media.istockphoto.com/photos/portrait-of-a-mature-man-with-a-little-smile-at-the-camera-right-side-picture-id1277873802?b=1&k=20&m=1277873802&s=170667a&w=0&h=jkQ_v0-o10phanZhWxRn9QpvCAUKn8qwdWT5BtR9QWk='),
    ));

    final divider = Divider(
      height: 60,
      color: Colors.grey,
    );

    final row = Row(children: [icon, spaceH, emailText]);

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        divider,
        txt1,
        spaceV,
        txt2,
        spaceV,
        txt3,
        spaceV,
        txt4,
        spaceV,
        row
      ],
    );

    final appBar = AppBar(
      title: const Text('Ninja ID Card'),
      centerTitle: true,
      backgroundColor: Colors.grey[900],
    );

    final floatingActionButton = FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
        onPressed: () {
          setState(() {
            ninjaLevel += 1;
          });
        });

    final body = Padding(
      padding: EdgeInsets.all(20),
      child: column,
    );

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

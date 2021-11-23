// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> list = [
    Quote(author: 'Abc Xyz', text: 'I have a pen'),
    Quote(author: 'Abc Xyz', text: 'Why do you have the map of the world'),
    Quote(author: 'Abc Xyz', text: 'Now, you have the toy')
  ];

  @override
  Widget build(BuildContext context) {
    // Wigdets
    final appBar = AppBar(
      title: Text('List Widget'),
      centerTitle: true,
    );

    final body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list
            .map((e) => QuoteCard(
                  quote: e,
                ))
            .toList());

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appBar,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: body,
        ));
  }
}

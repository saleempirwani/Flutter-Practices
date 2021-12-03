import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppBar
    final appBar = AppBar(
      title: const Text('My First App 23'),
      centerTitle: true,
      backgroundColor: Colors.grey,
    );

    // Button
    final btn = ElevatedButton.icon(
      onPressed: () {},
      onLongPress: () {
        print('you long pressed it');
      },
      icon: const Icon(Icons.mail),
      label: const Text('Mail me'),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
    );

    // Fixed Floating Button
    final floatingBtn = FloatingActionButton(
        onPressed: () {},
        tooltip: 'Press it',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ));

    // Network Image
    final newtworkImage = Image.network(
        'https://images.unsplash.com/photo-1637090560884-d383467a645e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=669&q=80');

    // Local Image
    final assetImage = Image.asset('assets/images/image.jpg');

    // Text
    const text = Text('Hello World',
        style: TextStyle(
            fontFamily: 'IndieFlower', fontSize: 25, color: Colors.grey));

    // Icons
    const icon = Icon(
      Icons.car_rental,
      color: Colors.blue,
      size: 100,
    );

    // IconButton
    final iconBtn = IconButton(
      onPressed: () {},
      icon: const Icon(Icons.volume_up),
      tooltip: 'Increase volume by 10',
    );

    // Center Widget
    final center = Center(child: iconBtn);

    // Container Widget
    final container = Container(
      color: Colors.amber[500],
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      child: const Text('Hello World'),
    );

    // Padding Widget
    const padding = Padding(
      padding: EdgeInsets.all(40),
      child: Text('This is a flutter app'),
    );

    // Row
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text,
        btn,
        icon,
      ],
    );

    final column = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[btn, btn, btn],
    );

    final expanded = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: newtworkImage,
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.amber,
            child: const Text('First'),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.cyan,
            child: const Text('Second'),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.greenAccent,
            child: const Text('Third'),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: expanded,
      floatingActionButton: floatingBtn,
    );
  }
}

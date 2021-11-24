import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  void getDate() {
    Future.delayed(Duration(seconds: 3), () {
      print('Hello World');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    getDate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        centerTitle: true,
        title: Text('Location'),
      ),
      body: Text('Location'),
    );
  }
}

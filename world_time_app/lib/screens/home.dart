import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map params = {};

  @override
  Widget build(BuildContext context) {
    // Routes Params
    params = ModalRoute.of(context)?.settings.arguments as Map;
    print(params);

    String bgImage = params['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = params['isDayTime'] ? Colors.blue : Colors.blue;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/$bgImage'))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Edit Location",
                      style: TextStyle(color: Colors.white),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      params['location'],
                      style: TextStyle(
                          letterSpacing: 2, fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  params['time'],
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ],
            ),
          ),
        )));
  }
}

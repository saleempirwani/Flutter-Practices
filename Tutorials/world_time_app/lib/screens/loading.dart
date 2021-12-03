import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/screens/home.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading, please wait...';

  void getTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': worldTime.flag,
      'time': worldTime.time,
      'location': worldTime.location,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SpinKitFadingCircle(color: Colors.blue, size: 50)));
  }
}

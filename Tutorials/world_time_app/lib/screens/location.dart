import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', url: 'Europe/London', flag: 'uk.png'),
    WorldTime(location: 'Athens', url: 'Europe/Athens', flag: 'greece.png'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(location: 'Nairobi', url: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(location: 'Chicago', url: 'America/Chicago', flag: 'usa.png'),
    WorldTime(location: 'New York', url: 'America/New_York', flag: 'usa.png'),
    WorldTime(location: 'Seoul', url: 'Asia/Seoul', flag: 'south_korea.png'),
    WorldTime(location: 'Jakarta', url: 'Asia/Jakarta', flag: 'indonesia.png'),
  ];

  void updateLocation(index) async {
    WorldTime worldTime = locations[index];

    await worldTime.getTime();
    Navigator.pop(context, {
      'flag': worldTime.flag,
      'time': worldTime.time,
      'location': worldTime.location,
      'isDayTime': worldTime.isDayTime,
    });
  }

  // void getDate() {
  //   Future.delayed(Duration(seconds: 3), () {
  //     print('Hello World');
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    // getDate();
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
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return (Card(
                child: ListTile(
                  onTap: () {
                    updateLocation(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${locations[index].flag}'),
                  ),
                ),
              ));
            }));
  }
}

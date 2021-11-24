import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String time = '';
  String flag = '';
  String location = '';
  String url = '';

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    http.Response response = await http.get(uri);
    Map datetime = jsonDecode(response.body);
    DateTime now = DateTime.parse(datetime['datetime']);
    int offset = int.parse(datetime['utc_offset'].substring(1, 3));
    now = now.add(Duration(hours: offset));
    time = now.toString();
  }
}

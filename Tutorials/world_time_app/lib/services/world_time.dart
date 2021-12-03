import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String time = '';
  String flag = '';
  String location = '';
  String url = '';
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    try {
      http.Response response = await http.get(uri);
      Map datetime = jsonDecode(response.body);
      DateTime now = DateTime.parse(datetime['datetime']);
      int offset = int.parse(datetime['utc_offset'].substring(1, 3));
      now = now.add(Duration(hours: offset));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print("ERR [getTime] ==============> $e");
      time = 'Something went wrong, could not get time.';
      Fluttertoast.showToast(
          msg: 'Something went wrong, could not get time.',
          backgroundColor: Colors.grey[800]);
    }
  }
}

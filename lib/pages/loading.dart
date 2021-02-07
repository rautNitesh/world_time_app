import 'package:flutter/material.dart';
import 'package:test_application/services/get_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String loading = "Loading";
  String country = 'Asia/Kathmandu';

  void getTime() async {
    GetTime instance = GetTime(country: country, flag: 'nepal.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'country': instance.country,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 120.0, 8.0, 0.0),
        child: Container(
          child: Text(loading),
        ),
      ),
    );
  }
}

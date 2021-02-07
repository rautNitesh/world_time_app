import 'package:flutter/material.dart';
import 'package:test_application/services/get_time.dart';

class EditLocation extends StatefulWidget {
  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  List<GetTime> locations = [
    GetTime(country: 'Asia/Kathmandu', flag: 'a'),
    GetTime(country: 'Asia/NewDelhi', flag: 'a'),
    GetTime(country: 'Asia/Thimpu', flag: 'a'),
    GetTime(country: 'Asia/Karachi', flag: 'a'),
    GetTime(country: 'Asia/Tokyo', flag: 'a'),
    GetTime(country: 'Asia/Pyongyang', flag: 'a'),
  ];

  void updateTime(index) async {
    GetTime instance = GetTime(country: locations[index].country, flag: 'flag');
    await instance.getTime();
    Navigator.pop(context, {
      'country': instance.country,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].country),
            ),
          );
        },
      ),
    );
  }
}

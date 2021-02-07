import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class GetTime {
  String time;
  String country;
  String flag;
  bool isDaytime = true;

  GetTime({this.country, this.flag});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$country');
      if (response.statusCode == 404) {
        throw (response.body);
      }

      Map rawData = jsonDecode(response.body);

      DateTime now = DateTime.parse(rawData['datetime']);
      String offsetH = rawData['utc_offset'].substring(1, 3);
      String offsetM = rawData['utc_offset'].substring(4, 6);

      now = now.add(
          new Duration(hours: int.parse(offsetH), minutes: int.parse(offsetM)));
      String datetime = DateFormat('jm', 'en_US').format(now);
      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
      time = datetime.toString();
    } catch (e) {
      time = "no data";
    }
  }
}

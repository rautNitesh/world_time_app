import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime']
        ? 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/day.png'
        : 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/night.png';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage('$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                data["country"].toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Text(
              data["time"],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 66.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            ButtonTheme(
              minWidth: 230.0,
              child: RaisedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'country': result['country'],
                      'isDayTime': result['isDayTime']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.white,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

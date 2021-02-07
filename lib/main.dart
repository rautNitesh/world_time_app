import 'package:flutter/material.dart';
import 'package:test_application/pages/homepage.dart';
import 'package:test_application/pages/loading.dart';
import 'package:test_application/pages/edit-location.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/home': (context) => HomePage(),
    '/location': (context) => EditLocation(),
    '/': (context) => Loading()
  }));
}

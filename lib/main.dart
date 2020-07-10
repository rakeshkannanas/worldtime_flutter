import 'package:flutter/material.dart';
import 'package:worldtime/activities/choose_location.dart';
import 'package:worldtime/activities/home.dart';
import 'package:worldtime/activities/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/choose_location':(context) => ChooseLocation()
    },
  ));
}


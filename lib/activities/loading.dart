import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setuptime() async
  {
    WorldTime worldtime = new WorldTime(location: 'Kolkata',urlend: 'Asia/Kolkata',flag: 'https://cdn.countryflags.com/thumbs/india/flag-400.png');
    await worldtime.getdata();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':worldtime.location,
      'flag':worldtime.flag,
      'time':worldtime.time,
      'isday':worldtime.isday
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState func called');
    setuptime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:
      SpinKitWave(
        color: Colors.white,
        size: 60.0,
      )
    );
  }
}

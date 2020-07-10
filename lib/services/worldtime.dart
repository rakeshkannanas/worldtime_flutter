import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String location;
  String urlend;
  String flag;
  bool isday;
  String time;
  WorldTime({this.location,this.urlend,this.flag});

  void getdata () async
  {
    try{
      Response result = await get('http://worldtimeapi.org/api/timezone/$urlend');
      Map data = jsonDecode(result.body);

      String offsethrs = data['utc_offset'].substring(1,3);
      String offsetmins = data['utc_offset'].substring(4,6);

      DateTime now = DateTime.parse(data['datetime']);
      now = now.add(Duration(hours:int.parse(offsethrs),minutes: int.parse(offsetmins)));
      isday = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e)
    {
      print(e);
      time = 'Network Error !';
    }
  }
}
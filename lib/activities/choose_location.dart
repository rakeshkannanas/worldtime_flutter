import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count =0;
  List<WorldTime> locations = [
    WorldTime(location: 'Chennai',urlend: 'Asia/Kolkata',flag: 'https://cdn.countryflags.com/thumbs/india/flag-400.png'),
    WorldTime(urlend: 'Europe/London', location: 'London', flag: 'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/uk.png?raw=true'),
    WorldTime(urlend: 'Europe/Berlin', location: 'Athens', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/greece.png'),
    WorldTime(urlend: 'Africa/Cairo', location: 'Cairo', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/egypt.png'),
    WorldTime(urlend: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/kenya.png?raw=true'),
    WorldTime(urlend: 'America/Chicago', location: 'Chicago', flag: 'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/usa.png?raw=true'),
    WorldTime(urlend: 'America/New_York', location: 'New York', flag: 'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/usa.png?raw=true'),
    WorldTime(urlend: 'Asia/Seoul', location: 'Seoul', flag: 'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/south_korea.png?raw=true'),
    WorldTime(urlend: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/indonesia.png?raw=true'),
  ];

  void updatetime(index) async {
    WorldTime wt = locations[index];
    await wt.getdata();

    Navigator.pop(context,{
      'location':wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isday':wt.isday
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Choose a Location',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(locations[index].location),
              onTap: (){
                updatetime(index);
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(locations[index].flag),
              ),
            ) ,
          );
        },
      )
    );
  }
}

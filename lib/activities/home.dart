import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map  data = {};
  @override
  Widget build(BuildContext context) {
    print('home build func called');
   data = data.isNotEmpty  ? data : ModalRoute.of(context).settings.arguments;

    print(data);
    String bgpic = data['isday'] ? 'day.jpg' : 'night.jpg';
    Color bgcolor = data['isday'] ? Colors.blue : Colors.black;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$bgpic'),
                  fit: BoxFit.cover,
                )
            ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async{
                       dynamic result = await Navigator.pushNamed(context, '/choose_location');
                       if(result == null)
                         {

                         }
                       else {
                         setState(() {
                           data = result;
                         });
                       }

                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[200],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),

                    )),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

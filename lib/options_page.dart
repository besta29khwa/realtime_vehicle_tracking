import 'dart:async';


import 'package:flutter/material.dart';
import 'package:realtime_vehicle_tracking/lib/mymap.dart';
import 'package:location/location.dart' as loc;

import 'map_page.dart';

class OptionPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<OptionPage> {


  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Track in Realtime'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100,right: 50, left: 50),
            child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Vehicle Registration No:.',
                      counterStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decorationColor: Colors.yellowAccent,
                      ),
                      hintText: 'for example: MZ291',
                      isDense: false,
                      hintStyle: TextStyle(color: Colors.white54),
                      suffixIcon: Icon(Icons.arrow_forward_ios),
                      filled: false,
                      fillColor: Colors.blueGrey,

                    ),
                  ),
          ),
          SizedBox(height: 80,),
          MaterialButton(
            color: Colors.blue,
            child: Text('Trace'),
            onPressed: () {

                print("Email: ${textController}");
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>

                MapMap(textController.text))

                );

    }

          ),
        ],
      ),
    );
  }




}

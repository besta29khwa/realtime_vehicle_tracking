import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_vehicle_tracking/Login_page.dart';
import 'package:realtime_vehicle_tracking/lib/phone-track.dart';
import 'package:realtime_vehicle_tracking/signup_page.dart';
import 'map_page.dart';
import 'options_page.dart';

import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),


      routes: {
        '/': (context) => HomePage(),
        '/options_page': (context)=> OptionPage(),
        // '/home_page' : (context) => HomePage(),
        '/Login_page' : (context) => LoginPage(),
        '/lib/phone-track' : (context) => Mobile(),
        '/signup_page': (context) => SignUpPage(),

      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class  HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.cyan[900],
      body: SingleChildScrollView(
        child: Container(

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('tools/starting_img.png'),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            alignment: Alignment.topLeft,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(top: 90,),
                  child: Stack(

                    children: [
                      Text(
                          "Vehicle Tracking \n  Platiform",
                          style: TextStyle(
                              fontSize: 31,
                              letterSpacing: 4,
                              wordSpacing: 12,
                              fontWeight: FontWeight.w500,
                              foreground: new Paint()
                                ..style = PaintingStyle.stroke
                                ..color = Colors.black45
                                ..strokeWidth = 1
                          )
                      ),
                      Text(
                        "Vehicle Tracking \n  Platiform",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 31,
                          wordSpacing: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 4,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(

                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10, left:35),
                  child: Lottie.asset('tools/anime/66748-mapa.json'),

                ),
                SizedBox(height: 20),
                Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Text(
                              " Track  your  Vehicle \n              Here ",
                              style: TextStyle(
                                  fontSize: 24,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.normal,
                                  foreground: new Paint()
                                    ..style = PaintingStyle.stroke
                                    ..color = Colors.black54
                                    ..strokeWidth = 0.5
                              )
                          ),
                          Text(
                            " Track  your  Vehicle \n              Here ",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              letterSpacing: 2,
                              fontWeight: FontWeight.normal,

                            ),
                          ),
                        ],
                      ),


                      Container(
                        padding: const EdgeInsets.only(top: 80, bottom: 70),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            primary: Colors.indigo[400],
                            onPrimary: Colors.white
                          ),
                          child: Text('   L o g i n    t o    g e t    S t a r t e d   '),
                          onPressed: () => {
                                    Navigator.pushNamed(context, '/Login_page'),
                                  }),
                      ),


                    ],
                  ),

               SizedBox(height: 159)
              ],
            ),
          )
        ),
      ),
    );

  }
}

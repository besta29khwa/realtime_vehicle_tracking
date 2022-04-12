import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realtime_vehicle_tracking/options_page.dart';
import 'package:lottie/lottie.dart';
import 'package:realtime_vehicle_tracking/user_model.dart';


import 'options_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool? isRememberMe = false;

  final  firstController = new TextEditingController();
  final  secondController = new TextEditingController();
  final  companFreetController = new TextEditingController();
  final  phoneController = new TextEditingController();
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.cyan[900],

      appBar: AppBar(
        title: Text('Auth User (Logged ' + (user == null? 'out': 'in') + ')'),
        backgroundColor: Colors.black38,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 35, left: 50, right: 50, bottom: 0),
        constraints: BoxConstraints.expand(),
        // padding: const EdgeInsets.only(
        //            top: 55, left: 57, right: 57, bottom: 0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('tools/option_img.png'),
              fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children:[
                  Lottie.asset('tools/anime/65496-car-animation (1).json'),
          Container(
          // padding: EdgeInsets.only(top: 55, left: 57, right: 57, bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.white60,
                blurRadius: 6,
                offset: Offset(0,2),
              )
            ]
        ),
        child: Text(
            'Register Now',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black54,
              letterSpacing: 4,
              // wordSpacing: 6,
              fontWeight: FontWeight.w500,
              // foreground: new Paint()
              //   ..style = PaintingStyle.stroke
              //   ..color = Colors.green.shade50
              //   ..strokeWidth = 1
            )
        ),

      ),
          ]
              ),
              SizedBox(height: 20,),
              Container(
                // padding: EdgeInsets.only(left: 5, right: 57, bottom: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 6,
                        offset: Offset(0,2),
                      )
                    ]
                ),
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [

                    TextFormField(
                      controller: firstController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      // onSaved: (value) {
                      //   passwordController.text = value!;
                      // },
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black38,
                          ),
                          labelText: 'First Name',
                          hintText: "First Name",
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          )
                      ),
                    ),
                    SizedBox(height: 7,),
                    ///--------------------------------------------------------
                    TextFormField(
                      controller: secondController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      // onSaved: (value) {
                      //   passwordController.text = value!;
                      // },
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black38,
                          ),
                          labelText: 'Surname',
                          hintText: "Surname",
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          )
                      ),
                    ),
                    SizedBox(height: 7,),
                    ///-------------------------------------------------------------------


                    TextFormField(
                      controller: companFreetController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      // onSaved: (value) {
                      //   companFreetController.text = value!;
                      // },
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      autofocus: false,
                      decoration: InputDecoration(
                        // border: InputBorder.none,

                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.airport_shuttle_outlined,
                            color: Colors.black38,
                          ),
                          labelText: 'Freet Name',
                          hintText: "Company/Freet Name ",
                          hintStyle: TextStyle(
                            color: Colors.black12,)
                      ),
                    ),
                    SizedBox(height: 7,),

                    ///-----------------------------------------------------------------



                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      // onSaved: (value) {
                      //   emailController.text = value!;
                      // },
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black38,
                          ),
                          labelText: 'Email',
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                            color: Colors.black12,)
                      ),
                    ),

                    SizedBox(height: 7,),

                    ///-----------------------------------------------------------------
                    ///
                    TextFormField(
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      // onSaved: (value) {
                      //   emailController.text = value!;
                      // },
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black38,
                          ),
                          labelText: 'Phone',
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.black12,)
                      ),
                    ),

                    SizedBox(height: 7,),

                    /// -----------------------------------------------------------------

                    TextFormField(
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      // onSaved: (value) {
                      //   passwordController.text = value!;
                      // },
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.black38,
                          ),
                          labelText: 'Password',
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          )
                      ),
                    ),
                    SizedBox(height: 7,),
                    ///-----------------------------------------------------------------


                    TextFormField(
                      controller: confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      // onSaved: (value) {
                      //   passwordController.text = value!;
                      // },
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(
                            Icons.vpn_key_outlined,
                            color: Colors.black38,
                          ),
                          labelText: 'Confirm',
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black12,
                          )
                      ),
                    ),
                    SizedBox(height: 7,),
                    ///-----------------------------------------------------------------
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.shade900,
                              blurRadius: 0,
                              offset: Offset(0,2),
                            )
                          ]
                      ),
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(

                        onPressed: () async {
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                          ).then((value) => {
                            postDetailsToFirestore()
                          }).catchError((error) {
                            print('\n\n\t----------Error-------\n${error.toString()}\n');
                             Fluttertoast.showToast(msg: "ERROR HAPPENED (${error.toString()})");
                          });

                        },
                        padding: EdgeInsets.only(right: 0),
                        child: Text(
                          '         Sign Up           ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            wordSpacing: 5.0,
                            letterSpacing: 4,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ),
                    ),

                    ///-----------------------------------------------------------------

                    Row(
                      children: [
                        Text('  Already have an account?   ',
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14,
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, '/Login_page'),
                              },
                              hoverColor: Colors.green[800],
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],

                ),
              )
            ],
          ),
        ),
      ),
    );


  }

  postDetailsToFirestore() async {
    //calling uor firebase
    // Calling our user model
    // Sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();

    //  writting all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstController.text;
    userModel.secondName = secondController.text;

    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());

    Fluttertoast.showToast(msg: 'Account Created Seccessfully.');
    
    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(
            builder: (context) => OptionPage() ),
            (route) => false);

  }
}
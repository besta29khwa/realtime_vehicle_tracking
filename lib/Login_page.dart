import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import 'map_page.dart';
import 'options_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObsecure = true;
  bool pass = false ;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool? isRememberMe = false;
  // final LoginController companFreetController = new LoginController(),
  // final LoginController emailController = new LoginController(),
  // final LoginController passwordController = new LoginController(),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[900],

        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 50, right: 50, bottom: 0),
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
                  children: [
                    Lottie.asset('tools/anime/65496-car-animation (1).json'),

                    Container(
                      alignment: Alignment.center,

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
                      child: Text(
                      'Welcome',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black54,
                  letterSpacing: 8,
                  wordSpacing: 6,
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
                SizedBox(height: 40,),
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
                  child: Form(
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        ///-------------------------------------------------------------------



                        SizedBox(height: 30,),

                        ///-----------------------------------------------------------------



                        TextFormField(
                          autofocus: false,
                          controller: emailController,
                          /// Validator with firebase
                          validator: (value) {
                            if(value.toString().isNotEmpty){
                              value.toString().isNotEmpty ? null : "Please enter your Email";
                            }
                            if(!RegExp("^*!#%)(+_<>?:;~`").hasMatch(value.toString())){
                              return ("Enter a valid Email.");
                            }
                            return null;
                          },
                          onSaved: (value){
                            emailController.text = value!;
                          },
                          // controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          // onSaved: (value) {
                          //   emailController.text = value!;
                          // },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black38,
                            ),
                            hintText: "Email Address",
                              labelText: 'Email',
                            hintStyle: TextStyle(
                            color: Colors.black12,)
                          ),
                        ),

                        SizedBox(height: 10,),

                        ///-----------------------------------------------------------------



                        TextFormField(
                          obscureText: pass ? _isObsecure : true,
                          autofocus: false,
                          controller: passwordController,
                          validator: (value){
                            value!.length < 6 ? "Enter more than 6 char" : null;
                            },

                          onSaved: (value){
                            passwordController.text = value!;
                          },
                          // controller: passwordController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,

                          // onSaved: (value) {
                          //   passwordController.text = value!;
                          // },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            // border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: //pass
                                 IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObsecure = !_isObsecure;
                                      });
                                    },
                                  icon: Icon(Icons.visibility_off, color: Colors.black54,),
                                ),
                                // : null,
                            hintText: "Password",
                            labelText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.black12,
                            )
                          ),
                        ),

                        ///-----------------------------------------------------------------
                        Container(
                          alignment: Alignment.centerRight,
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            onPressed: () {
                              print('Forgot Password not implemented');
                              
                            },
                            padding: EdgeInsets.only(right: 0),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.normal,
                              ),

                            ),
                          ),
                        ),


                        ///-----------------------------------------------------------------
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.shade800,
                                  blurRadius: 0,
                                  offset: Offset(0,2),
                                )
                              ]
                          ),
                          alignment: Alignment.bottomCenter,
                          child: FlatButton(

                            onPressed: () async {
                              // if(_formKey.currentState!.validate()){
                              //   print("Email: ${emailController }");
                              //   print("Email: ${passwordController}");
                              // }

                              await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ).then((value) {
                                print("\n\n-------USER HAS JUST LOGGED IN.\n\n");
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => OptionPage() ));
                              }).onError((error, stackTrace) {
                                print("ERROR HAPPENED (${error.toString()})");
                              });

                            },

                            padding: EdgeInsets.only(right: 0),
                            child: Text(
                              '         Sign In           ',
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
                        ///
                        SizedBox(height: 15,),
                        ///-----------------------------------------------------------------
                        Container(
                          height: 20,
                          child: Row(
                              children: <Widget>[
                                Theme(
                                  data: ThemeData(unselectedWidgetColor: Colors.black),
                                  child: Checkbox(
                                    value: isRememberMe,
                                    checkColor: Colors.green,
                                    activeColor: Colors.black54,
                                    onChanged: (value){
                                      setState(() {
                                        isRememberMe = value;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Always Remember me.',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                          ),
                        ),

                        Row(
                          children: [
                            Text('  Not registered yet?   ',
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
                                      Navigator.pushNamed(context, '/signup_page'),
                                    },
                                  hoverColor: Colors.green[800],
                                  padding: EdgeInsets.only(right: 0),
                                  child: Text(
                                  'Register',
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
                            SizedBox(height: 40,)
                          ],
                        )
                      ],

                    ),
                  ),
                )
              ],
            ),
          ),
    ),
    );


  }

  void signIn(String email, String password) async{
    // if (_formKey.currentState.validate())
      await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text)
          .then((uid) =>
      {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OptionPage())),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });

      await _auth.signInWithEmailAndPassword(email: emailController.text.trim(),
          password: passwordController.text.trim());


  }
}

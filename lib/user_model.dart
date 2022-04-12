import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? secondName;
  String? email;


  UserModel({this.uid, this.firstName, this.secondName, this.email}
  );

  // Data from Serverfactory UserModel.fromMap(map){


 factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      email: map['email'],


    );
 }

  /// SEnding data to our server
  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'firstName': firstName,
      'secondName': secondName,
      'email': email,

     };
  }
}
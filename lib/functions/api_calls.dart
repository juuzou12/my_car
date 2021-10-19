import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class api_calls {

  var firebaseAuth= FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;

  final fireStoreInstance = FirebaseFirestore.instance;
  final CollectionReference _reference = FirebaseFirestore.instance.collection('preferences');

  /*login api call.....*/
  void loginUser(String email, String password, successFunction, failedFunction,
      wrongCred,unserNotFound) async{
    try {
      UserCredential userCredential= await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user!.email==email){
        successFunction();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        unserNotFound();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        wrongCred();
      }
    }

  }

  /*createUser api call.....*/
  void createUser(String email, String password, successFunction,
      failedFunction,weekPassword,userFound) async {
    try {
      UserCredential userCredential= await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!= null) {
        successFunction();
      }
    } on FirebaseAuthException catch (e) {
      print("Firebase exception");
      print(e.toString());
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        weekPassword();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        userFound();
      }
      failedFunction();
    }
  }

  /*register api call.....*/
  Future <void> addUser(final String name,
      successFunction, failedFunction) {
    return fireStoreInstance.collection('users').doc(firebaseAuth.currentUser!.uid)
        .set({
      'name': name,
      "userUID":firebaseAuth.currentUser!.uid
    })
        .then((value) => successFunction())
        .catchError((error) => failedFunction());
  }

  /*reset password api call....*/
  Future sendpasswordresetemail(String email,navigationFunction) async{
    var results= await _auth.sendPasswordResetEmail(email: email);
    navigationFunction();
  }

  Future<void> requestCall(final String StandAlone, final String Apartment, final String active,
      final String duration, final String companyState, final String companyNo, final String paymentMethod)
  async {
    var uuid=firebaseAuth.currentUser!.uid+DateTime.now().microsecondsSinceEpoch.toString();
    try{
      DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(firebaseAuth.currentUser!.uid).collection('request').doc(uuid);
      Map<String, dynamic> data = <String, dynamic>{
        "houseType": StandAlone,
        "purpose": Apartment,
        "duration": duration,
        "companyState": companyState,
        "companyNo": companyNo,
        "paymentMethod": paymentMethod,
        "status" : active,
        "uid":uuid,
        "houseHoldUUID":"",
      };
      await documentReference
          .set(data)
          .whenComplete(() => print("Preferences added"))
          .catchError((e) => print(e));
    } on FirebaseAuthException catch(e){
      print("-----$e");
    }
  }

  Future<void> addHome(final String HomeDetails, final String OwnerDetails, final Payment)async
  {
    /*TODO....the same as for the find location (requestCall)...also todo conformed*/
    try {
      DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(firebaseAuth.currentUser!.uid).collection('Home').doc();
      Map<String, dynamic> data = <String, dynamic>{
        "homeDetails": HomeDetails,
        "ownerDetails": OwnerDetails,
        "payment": Payment,
        "userUID":firebaseAuth.currentUser!.uid
      };
      await documentReference
          .set(data)
          .whenComplete(() => print("Home added"))
          .catchError((e) => print(e));
    } on FirebaseAuthException catch(e){
      print("-----$e");
    }
  }

  /*TODO for adding a new home.....
  *  1. use ownerNumber to create an account for home owners
  * 2. using the phone number to login the user (this will be promoted when the user switch to business mode
  * 3.introduce an OTP Page
  * 4. add to backend both owner creds and details.
  * --creds for my firebase ACC {mathu.ke@gmail.com} password {social.kenyans}//=={Social.kenyans}=={Juuzou@254}
  * under project bnbs*/
}
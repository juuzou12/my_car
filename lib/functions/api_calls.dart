import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class api_calls {

  final BuildContext context;
  var firebaseAuth= FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;

  final fireStoreInstance = FirebaseFirestore.instance;
  final CollectionReference _reference = FirebaseFirestore.instance.collection('preferences');

  api_calls(this.context);

  /*login api call.....*/
  void loginUser(String email, String password, successFunction, failedFunction,
      wrongCred) {
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    try {
      if (firebaseAuth.currentUser != null) {
        successFunction();
      } else {
        failedFunction();
      }
    } on FirebaseAuthException catch (exception) {
      print('This is a fail $exception');
    }
  }

  /*createUser api call.....*/
  void createUser(String email, String password, successFunction,
      failedFunction) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseAuth.currentUser!.uid != null) {
        successFunction();
      }
    } on FirebaseAuthException catch (e) {
      failedFunction();
    }
  }

  /*register api call.....*/
  Future <void> addUser(final String name, final String password,
      successFunction, failedFunction) {
    return fireStoreInstance.collection('users').doc(firebaseAuth.currentUser!.uid)
        .set({
      'name': name,
      'password': password,
    })
        .then((value) => successFunction())
        .catchError((error) => failedFunction());
  }

  /*reset password api call....*/
  void sendpasswordresetemail(String email) async{
    final results= await _auth.sendPasswordResetEmail(email: email);
    Navigator.of(context).pop();
  }

  Future<void> addItem(final String StandAlone, final String Apartment, final String active,
      final String duration, final String companyState, final String companyNo, final String paymentMethod,)
  async {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(firebaseAuth.currentUser!.uid).collection('request').doc();
    Map<String, dynamic> data = <String, dynamic>{
      "houseType": StandAlone,
      "purpose": Apartment,
      "duration": duration,
      "companyState": companyState,
      "companyNo": companyNo,
      "paymentMethod": paymentMethod,
      "status" : active,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Preferences added"))
        .catchError((e) => print(e));
  }

  Future<void> addHome(final String HomeDetails, final String OwnerDetails, final Payment)async
  {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(firebaseAuth.currentUser!.uid).collection('Home').doc();
    Map<String, dynamic> data = <String, dynamic>{
      "homeDetails": HomeDetails,
      "ownerDetails": OwnerDetails,
      "payment": Payment,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Preferences added"))
        .catchError((e) => print(e));
  }

}
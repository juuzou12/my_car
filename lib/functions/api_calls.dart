import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class api_calls {

  final BuildContext context;
  var firebaseAuth= FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;

  final fireStoreInstance = FirebaseFirestore.instance;

  api_calls(this.context);

  /*login api call.....*/
  void loginUser(String email, String password, successFunction, failedFunction,
      wrongCred) {
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    if (firebaseAuth.currentUser != null) {
      successFunction();
    } else {
      failedFunction();
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
    return users.doc(firebaseAuth.currentUser!.uid)
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
}
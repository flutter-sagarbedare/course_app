import 'package:course_app/const/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods{
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  Future<void> signUpMethod({
    required String email,
    required String password,
    required BuildContext context,
  })async{
    try{
        await _auth.createUserWithEmailAndPassword(email: email, password: password);


    }on FirebaseAuthException catch (ex){
      if(ex.code == "weak-password"){
        print("Weak password");
      }else if(ex.code == "email-already-in-use"){
        print("the Account Already Exists");
      }
      showSnackBar(context,ex.message!);
    }
  }


}

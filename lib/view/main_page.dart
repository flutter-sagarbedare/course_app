import 'dart:developer';

import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>
      (stream: FirebaseAuth.instance.authStateChanges(),
       builder:(context,snapshot){
        if(snapshot.hasData){
          log("Main Page has user data");
          return LandingScreen();
        }else{
          log("Main Page has no user data");

          return SignIn();
        }
       })
    );
  }
}
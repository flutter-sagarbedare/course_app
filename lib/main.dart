import 'package:course_app/view/courses_screen.dart';
import 'package:course_app/view/home_screen.dart';
import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/login_screen.dart';
import 'package:course_app/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:course_app/view/sign_up.dart';
import 'package:course_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return
    //  MultiProvider(
    //   providers:[],
    //   child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:LandingScreen(),
      home:ProfileScreen(),
    );
    // );
  }
}
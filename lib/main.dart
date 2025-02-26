import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/view/course_data_screen.dart';
import 'package:course_app/view/courses_screen.dart';
import 'package:course_app/view/home_screen.dart';
import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/login_screen.dart';
import 'package:course_app/view/profile_screen.dart';
import 'package:course_app/view/test_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:course_app/view/sign_up.dart';
import 'package:course_app/view/splash_screen.dart';
import 'package:provider/provider.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD-IQDE_sSSYTrgY_5nlRnBLp-vpzVQq9c",
    authDomain: "course-app-f2757.firebaseapp.com",
    projectId: "course-app-f2757",
    storageBucket: "course-app-f2757.firebasestorage.app",
    messagingSenderId: "486886794039",
    appId: "1:486886794039:web:f74c9cf24af32e636a30b2"
      )
  );
  runApp( MainApp());
}



class MainApp extends StatelessWidget{
  MainApp({super.key});

  //   dynamic _coursesLi = [];

  // void initState()async{

  //       log("main in init state");
  //      QuerySnapshot response = await  FirebaseFirestore.instance.collection('new123').get();

  //   response = await FirebaseFirestore.instance.collection('new123').get();
  //     for(int i = 0;i<response.docs.length;i++){
  //     _coursesLi.add(
  //       CourseModel(courseName: response.docs[i]['playerName'], courseDuration: response.docs[i]['jerNo'], coursePrice: response.docs[i]['type'])
  //       // CourseModel(courseName: response.docs[i]['Courses'][i]['course_name'], courseDuration: response.docs[i]['Courses'][i]['course_duation'], coursePrice: response.docs[i]['Courses'][i]['course_price'])
  //     );}

  //     log(_coursesLi);
    

  // }

  @override
  Widget build(BuildContext context){
    return
    //  MultiProvider(
    //   providers:[],
    //   child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:TestApp(),
      home:SplashScreen(),
    );
    // );
  }
}




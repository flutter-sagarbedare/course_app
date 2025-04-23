import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:course_app/view/test_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';


class Database {
  Stream? CourseStream;
  

   


  Future<Stream<QuerySnapshot>> getUsersDetails()async{
    print("In the get data");

    return await FirebaseFirestore.instance.collection("Users").snapshots();
  }

  Future<Stream<QuerySnapshot>> getCoursesDetails()async{
    print("In the get data");

    return await FirebaseFirestore.instance.collection("Studee123").snapshots();
  }


  Future AddCourseDetails(Map<String,dynamic> courseInfoMap,String id)async{
    print("In the add data");
    return await FirebaseFirestore.instance.collection('Studee123').doc(id).set(courseInfoMap);
  }

}























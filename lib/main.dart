import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:course_app/view/lectures_screen.dart';
import 'package:course_app/view/courses_screen.dart';
import 'package:course_app/view/home_screen.dart';
import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/profile_screen.dart';
import 'package:course_app/view/database.dart' as db;
import 'package:course_app/view/test_result.dart';
import 'package:course_app/view/user_data.dart';
import 'package:course_app/view/video_home.dart';
import 'package:course_app/view/yt_video_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:course_app/view/sign_up.dart';
import 'package:course_app/view/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main()async{
  // BindingBase.debugZoneErrorsAreFatal = true;
    WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD-IQDE_sSSYTrgY_5nlRnBLp-vpzVQq9c",
    authDomain: "course-app-f2757.firebaseapp.com",
    projectId: "course-app-f2757",
    storageBucket: "course-app-f2757.firebasestorage.app",
    messagingSenderId: "486886794039",
    appId: "1:486886794039:web:f74c9cf24af32e636a30b2"
      )
  );
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp( MainApp());
}



class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return
     MultiProvider(
      providers:[

        ChangeNotifierProvider(create: (_)=>CoreDataItems(selectedIndex: 0)),

        ChangeNotifierProvider<YtVideoViewModel>(create: (_)=>YtVideoViewModel(),),

        ChangeNotifierProvider(create: (_)=>UserInformation())

      ],
      child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
      // home:YoutubeHomePage(),
    )
    );
  }
}
 
 class UserModel {
  final String id;
  final String name;
  final String contactNumber;
  final String address;
  final String skill;
  final String education;
  final String experince;
  final List<String> course_own; // Example array field

  UserModel({required this.id, required this.name, required this.contactNumber, 
  required this.address,
  required this.skill,
  required this.education,
  required this.experince,
  required this.course_own
  }
  
  );

  factory UserModel.fromMap(String id, Map<String, dynamic> data) {
    return UserModel(
      id: id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      skill: data['skill'] ?? '',
      education: data['education'] ?? '',
      experince: data['experince'] ?? '',
      contactNumber: data['contactNumber'] ?? '',
      course_own: List<String>.from(data['course_own'] ?? []),
    );
  }
}

class UserInformation extends ChangeNotifier{

  Map<String,dynamic> userData = {};

  UserInformation();

}


class CoreDataItems extends ChangeNotifier{

  int selectedIndex;
  String? userEmail;
  

  String? userId;
  String? userName;
 
  Stream? CourseStream;

  Stream? userStream;

    UserModel? _user;
  UserModel? get user => _user;

   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String uId = '';

  


  CoreDataItems({required this.selectedIndex,this.userEmail});

  void setUserData(String id,String name){
  
    userId=id;
    userName=name;

  }

  void setUId(String UId){
    uId = UId;
    log("UId: $uId set in provider");
  }

  void setEmail(String email){
      userEmail = email;
  }

  void setUserId(String id){
    log('in setuserId');
    
    userId = id;
    log('user id is set $id');
  }

  void setUserName(String name){
    userName = name;
    log("user name set in provider");
  }
   String getUserName(){
    return userName!;
   }

    void getUseronTheLoad()async{
        print("In the get on the load");
        userStream = await FirebaseFirestore.instance.collection('Users').snapshots();
        notifyListeners();

    }



Stream<List<Map<String, dynamic>>> fetchUserData() {
    //  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    //   if (doc.exists) {
    //     _user = UserModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
    //     notifyListeners(); // Not

    return _firestore.collection('Users').snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
      }
  
  
  

  Stream<List<Map<String, dynamic>>> fetchData() {
    return _firestore.collection('Studee123').snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }


  void changeIndex(int index){
    selectedIndex=index;
    notifyListeners();
  }

  void getonTheLoad()async{
        print("In the get on the load");
        CourseStream = await db.Database().getCoursesDetails();
        notifyListeners();

    }


  // void access
}


// class CoursesData{

//       Stream? CourseStream;

//     CoursesData(){

  
//    getonTheLoad()async{
//         print("In the get on the load");
//         CourseStream = await db.Database().getCoursesDetails();
//         setState((){});
//     }

//     };

// }



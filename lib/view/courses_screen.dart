import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/main.dart';
import 'package:course_app/services/yt_api_services.dart';
import 'package:course_app/view/appbar_screen.dart';
import 'package:course_app/view/course_detail_screen.dart';
import 'package:course_app/view/lectures_screen.dart';
import 'package:course_app/view/video_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {

  List<dynamic> yourOwnCourses=[];

  List<Map<String, dynamic>> courseData = [];

  Stream? coursesStream;

   String? userId;
  String? userName;

  bool? courseFetched;

  Map<String,dynamic> userData ={};
   
 
    void setUserData(){

      userData =  Provider.of<UserInformation>(context,listen:false).userData;
      log("In Home Screen got userdata map from provider");
    }
  
  

   @override
   void initState(){
    setUserData();
    courseFetch();
    log("courses fetching");
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    // if(courseData.isEmpty){    
    //   return Center(child:Text("No Courses"));
    // }
    
    // courseFetch();
    
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Scaffold(
        // backgroundColor: Colors.blue,
        appBar: myAppBar(userData['name'],context),
        body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Text(
                  "Coding is All about Exloring...",
                  style: TextStyle(color: Colors.grey[600], fontSize: 17),
                ),
              ),
              // const SizedBox(
              //   height:20
              // ),
              Flexible(
                flex: 1,
                // height:MediaQuery.sizeOf(context).height/1.6,
                child: 
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color:const Color.fromARGB(150, 158, 158, 158),
                    // border: Border.all(color:Colors.red),
                    color: Color.fromARGB(237, 240, 244, 253),
      
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0.0,
                        blurRadius: 30,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child:AllCourses()),
            
        ) ]

      ))     
    );
        }
      
        



    Widget AllCourses()  {

        if (courseFetched == null || courseFetched == false) {
  
    return Center(child: CircularProgressIndicator());
  }

  if (courseData.isEmpty) {
    return Center(child: Text("No Courses Available"));
  }{

        return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: courseData.length,
              
              itemBuilder: (context, index) {               

                final course = courseData[index];

                return  GestureDetector(
                  onTap:()async{
                    log(course['source']);
                              
                                              var  videos =await YtApiServices().getAllVideosFromPlaylist(course['source']);
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return 
                               YoutubeHomePage(videos: videos,);
                                })
                              );
                  },
                  child: SizedBox(
                      height:320,
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            // height:250,
                            // width:250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                    
                              // borderRadius: BorderRadius.circular(
                              //   10,
                              // ),
                              // shape: BoxShape.rectangle,
                              color: Colors.black,
                            ),
                            child: Image.network(courseData[index]["imgsrc"],fit:BoxFit.contain),
                          ),
                    
                          Container(
                            // height:290,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                    
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                    
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(width: 20),
                                                    
                                    const SizedBox(width: 20),
                                                    
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            courseData[index]["Name"],
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "${courseData[index]["NoOfLectures"]} Lectures   Total ${courseData[index]["Hours"]}hr    ${courseData[index]["Duration"]} Months",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "${courseData[index]["Price"]}/- rs ",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                );
                

            
              },
            );
        }


    }

 

Future<List<DocumentSnapshot>> fetchOwnedCourses() async {
  courseFetch();
  final firestore = FirebaseFirestore.instance;

  List<DocumentSnapshot> resultDocs = [];

  for (String courseId in yourOwnCourses) {
    log("Course id = $courseId");
    final querySnapshot = await firestore
        .collection('Users')
        .where('Id', isEqualTo: courseId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      log("data is found");
      resultDocs.add(querySnapshot.docs.first);
    }else{
      log("data not found");
    }
  }

  return resultDocs;
}








    getCourseStream()async{
       coursesStream = await FirebaseFirestore.instance.collection("Studee123").doc(userId).snapshots();
    }

  void courseFetch()async{
      courseFetched = false; 
  setState(() {}); 
    
    log("in course fetch");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId');

    DocumentSnapshot doc =  await FirebaseFirestore.instance.collection("Users").doc(userId).get();

    
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // log("courses id ${data["courses_own"]}");

    yourOwnCourses = data["courses_own"];

    log("your courses are : $yourOwnCourses");
  for (String courseId in yourOwnCourses) {

    DocumentSnapshot coursesInfo =  await FirebaseFirestore.instance.collection("Studee123").doc(courseId).get();
   Map<String,dynamic> temp = coursesInfo.data() as Map<String, dynamic>;
    courseData.add(temp);
    // log("course data = $courseData");
  }
  courseFetched = true;

      setState(() {
        
      });
    log("courses fetched");


  
    }
         
}
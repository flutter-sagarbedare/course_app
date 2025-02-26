import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/view/appbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseModel{
  List courses;
 

  CourseModel({
    required this.courses
    });
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map _coursesList = {};

  void getData()async{
    log("In get data");
    QuerySnapshot response = await  FirebaseFirestore.instance.collection('final123').get();
    // _coursesList.clear();
   log('${response.docs.length}');
   log("${response.docs[0]['courses']}");
   _coursesList = response.docs[0]['courses'];
    // for(int i = 0;i<response.docs.length; i++){
    //   // log(" ${response.docs[i]['courses'][i]['flutter']}");
      
    //   log('in for of response');
    // _coursesList.add(
    //     CourseModel(
    //     courses: response.docs[1]['courses'],
    //   ),
     
    // );
    
      // _coursesList.add(
      //   CourseModel(courses:response.docs[i]['course1'])
      //   // CourseModel(courseName: response.docs[i]['Courses'][i]['course_name'], courseDuration: response.docs[i]['Courses'][i]['course_duation'], coursePrice: response.docs[i]['Courses'][i]['course_price'])
      // );
    // };
 
    // log("$_coursesList");
    
  }

  @override
  @mustCallSuper
  void initState(){
    log("In init state");
    getData();
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 244, 253),
        appBar: myAppBar("Hello Sagar"),
        // backgroundColor: Colors.blue,
        body: Column(
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
            Expanded(
              flex: 1,
              // height:MediaQuery.sizeOf(context).height/1.6,
              child: Container(
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
                child: ListView(
                  children: [
                    Container(
                      height: 150,
                      width: 327,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 42, 37, 117),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Your Courses!",
                                style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "User Experience Class",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () async {
                                  Map<String,dynamic> data={
                                    'courses':{
                                      'flutter':{
                                        "flutter",
                                        '120',
                                        '10000',
                                      },
                                      'c':{
                                        "c",
                                        '40',
                                        '5000',
                                      },
                                      'c++':{
                                      
                                        "c++",
                                        '40',
                                        '15000',
                                      },
                                      'java':{
                                      
                                        "Java",
                                        '30',
                                        '2000',
                                      },
                                      'python':{
                                        "Python",
                                        '70',
                                        '7000',
                                      },

                                      'dart':{                                     
                                        "Dart",
                                        '20',
                                        '9000',
                                      },
                                    }
                                  
                                  
                                  };
                                  log("data = $data");
                                  await FirebaseFirestore.instance
                                      .collection('final123')
                                      .add(data);
                                },
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        161,
                                        107,
                                        196,
                                      ),
                                      // border: Border.all(color:Colors.red),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "See Courses",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Image.asset("assets/studying.png", height: 84),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending Courses",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: ()async {
                                getData();
                            print(_coursesList[0][0]['c']);
                                setState((){

                                });
                          },
                          child: Text(
                            "See All",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 20);
                        },
                        itemBuilder: (context, index) {
                          return
                          //  GestureDetector(
                          //   onTap:(){
                          //   },
                          //   child: Container(
                          //     height:50,
                          //     width:210,
                          //     decoration: BoxDecoration(
                          //       color:Colors.blue,
                          //       borderRadius: BorderRadius.circular(16)
                          //     ),
                          //   ),
                          // );
                          SizedBox(
                            height: 30,
                            width: 260,
                            child: Column(
                              children: [
                                Container(
                                  // height:290,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),

                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      const SizedBox(width: 20),
                                      Container(
                                        // height:90,
                                        // width:90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          // shape: BoxShape.rectangle,
                                          color: Colors.black,
                                        ),
                                        child: Image.asset(
                                          'assets/studying.png',
                                        ),
                                      ),
                                      const SizedBox(width: 20),

                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "C Language",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text(
                                                  "20 Lectures   Total 40hr    100 MCQ",
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
                                                  "4000/- rs ",
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
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                          ),
                                          child: Center(child: Text("Buy Now")),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended Courses",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 20);
                        },
                        itemBuilder: (context, index) {
                          return
                          //  GestureDetector(
                          //   onTap:(){
                          //   },
                          //   child: Container(
                          //     height:50,
                          //     width:210,
                          //     decoration: BoxDecoration(
                          //       color:Colors.blue,
                          //       borderRadius: BorderRadius.circular(16)
                          //     ),
                          //   ),
                          // );
                          SizedBox(
                            height: 30,
                            width: 260,
                            child: Column(
                              children: [
                                Container(
                                  // height:290,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      const SizedBox(width: 20),
                                      Container(
                                        // height:90,
                                        // width:90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          // shape: BoxShape.rectangle,
                                          color: Colors.black,
                                        ),
                                        child: Image.asset(
                                          'assets/studying.png',
                                        ),
                                      ),
                                      const SizedBox(width: 20),

                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            
                                            Text(
                                              "C Language",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text(
                                                  "20 Lectures   Total 40hr    100 MCQ",
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
                                                  "4000/- rs ",
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
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                          ),
                                          child: Center(child: Text("Buy Now")),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    //  Text("Our Teachers",
                    //  style: GoogleFonts.montserrat(
                    //               fontSize: 22,
                    //               color:Colors.black,
                    //               fontWeight: FontWeight.bold
                    //           ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    //  SizedBox(
                    //   height:190,
                    //   child: ListView.separated(

                    //     scrollDirection: Axis.horizontal,
                    //     itemCount:10,
                    //     separatorBuilder: (context,index){
                    //       return SizedBox(
                    //         width:20
                    //       );
                    //     },
                    //     itemBuilder: (context,index){
                    //     return GestureDetector(
                    //       onTap:(){

                    //       },
                    //       child: Container(
                    //         height:50,
                    //         width:210,
                    //         decoration: BoxDecoration(
                    //           color:Colors.yellow,
                    //           borderRadius: BorderRadius.circular(16)
                    //         ),
                    //       ),
                    //     );
                    //   }),
                    // ),
                    Text(
                      "Our Teachers",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 20);
                        },
                        itemBuilder: (context, index) {
                          return
                          //  GestureDetector(
                          //   onTap:(){
                          //   },
                          //   child: Container(
                          //     height:50,
                          //     width:210,
                          //     decoration: BoxDecoration(
                          //       color:Colors.blue,
                          //       borderRadius: BorderRadius.circular(16)
                          //     ),
                          //   ),
                          // );
                          SizedBox(
                            height: 30,
                            width: 260,
                            child: Column(
                              children: [
                                Container(
                                  // height:290,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      const SizedBox(width: 20),
                                      Container(
                                        // height:90,
                                        // width:90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          // shape: BoxShape.rectangle,
                                          color: Colors.black,
                                        ),
                                        child: Image.asset(
                                          'assets/studying.png',
                                        ),
                                      ),
                                      const SizedBox(width: 20),

                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sagar Bedare",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text(
                                                  "10 Years Teaching Experience",
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
                                                  "Graduated ",
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
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Column(
            //   children: [
            //     ListView.builder(
            //       itemCount: 20,
            //       itemBuilder: (BuildContext context,int index){
            //         return Text("Sga");
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:course_app/view/appbar_screen.dart';
import 'package:course_app/view/course_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Scaffold(
        // backgroundColor: Colors.blue,
        appBar: myAppBar("Youe Courses"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                
                   padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color:const Color.fromARGB(150, 158, 158, 158),
                    // border: Border.all(color:Colors.red),
                color: Color.fromARGB(255, 240, 244,253),
              
                    boxShadow: [
                      BoxShadow(
                        color:Colors.black,
                        spreadRadius: 0.0,
                        blurRadius: 30,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(30),
                      topRight:Radius.circular(30),
                      )
                  ),
                child:ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context,index){
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context,index){
                      return
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color:Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network("https://th.bing.com/th/id/OIP.gZdVA2Uov4GGRzJc9vXuKAHaEK?rs=1&pid=ImgDetMain"),
                            const SizedBox(height:10),

 Padding(
                                padding: const EdgeInsets.only(left:20.0,top:10,bottom:15,right:10),
                                child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text("Flutter Online",
                                  style:GoogleFonts.montserrat(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  )
                                  ),
                                  const SizedBox(height:10),
                                  Text("72% Completed",style:GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                  )
                                  ),
                                  ]
                                ),
                              
                              GestureDetector(
                                onTap:(){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                    return CourseDataScreen(); 
                                  }));
                                },
                                child: Icon(Icons.arrow_circle_right,
                                size:40
                                ),
                              )
                            ],
                          ),
                          ),
                          ],
                        ),
                      ) ;
                      
                    
//                        Column(
//                         children: [
//                           Container(
//                             // height:290,                        
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color:Colors.red,
//                             ),
//                             child:Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
                          
//                               children: [
//                                 const SizedBox(width:20),
//                                 Container(
//                                   // height:90,
//                                   // width:90,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     // shape: BoxShape.rectangle,
//                                     color:Colors.black
//                                   ),
//                                   child:Image.asset('assets/studying.png')
//                                 ),
//                                 const SizedBox(
//                                   width:20
//                                 ),
                               
//                                     Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
                                         
//                                           Text(
//                                             "C Language",
//                                             style:GoogleFonts.montserrat(
//                                               fontSize:22,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height:10
//                                           ),
//                                           Row(
//                                             children: [
                                            
//                                               Text("20 Lectures   Total 40hr    100 MCQ",
//                                               style:GoogleFonts.montserrat(
//                                                 fontSize:13,
//                                                 fontWeight:FontWeight.w600
//                                               )),
//                                             ],
//                                           ),
//                                           const SizedBox(height:10)
// ,                                          Row(
//                                             children: [
                                            
//                                               Text("4000/- rs ",
//                                               style:GoogleFonts.montserrat(
//                                                 fontSize:19,
//                                                 fontWeight:FontWeight.w600
//                                               )),
//                                             ],
//                                           ),
                          
//                                         ],
//                                       ),
//                                     ),
//                                   GestureDetector(
//                                     onTap:(){},
//                                     child:Container(
//                                       height:60,
//                                       decoration: BoxDecoration(
//                                         color:Colors.blue,
//                                         borderRadius: BorderRadius.circular(13)
//                                       ),
//                                       child:Center(
//                                         child:Text("Buy Now")
//                                       )
//                                     )
//                                   )
//                               ],
//                             )
//                           ),
//                         ],
//                       );

                    },
                  
                  )
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

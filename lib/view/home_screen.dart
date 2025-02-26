import 'dart:io';

import 'package:course_app/view/appbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState ()=>_HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 244,253),
        appBar:myAppBar(),
        // backgroundColor: Colors.blue,
       body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height:10),
           
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Text("You should know code till Core...",
              style:TextStyle(
                color:Colors.grey[600],
                fontSize: 17
              )
              ),
            ),
            // const SizedBox(
            //   height:20
            // ),
          Expanded(
            flex:1,
              // height:MediaQuery.sizeOf(context).height/1.6,
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
                child: ListView(
                  children: [
                    Container(
                      height:150,
                      width:327,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:Color.fromARGB(255, 42, 37, 117),                  

                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text("Your Courses!",
                              style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                               const SizedBox(
                                height: 8,
                              ),
                               Text("User Experience Class",
                               style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                              const SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                onTap:(){
                                  
                                },
                                child:Center(
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color:const Color.fromARGB(255, 161, 107, 196),
                                      // border: Border.all(color:Colors.red),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Text("See Courses",
                                       style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color:Colors.white,
                                      // fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ),
                                  ),
                                )
                              )

                            ],
                          ),
                          const SizedBox(
                            width:10
                          ),
                          Image.asset("assets/studying.png",
                          height: 84,
                          )
                        ],
                      )
                    ),
                    const SizedBox(
                      height:12
                    ),
                    Text("Trending Courses",
                     style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color:Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                    ),
                    SizedBox(
                      height:190,
                      child: ListView.separated(
                        
                        scrollDirection: Axis.horizontal,
                        itemCount:10,
                        separatorBuilder: (context,index){
                          return SizedBox(
                            width:20
                          );
                        },
                        itemBuilder: (context,index){
                        return GestureDetector(
                          onTap:(){

                          },
                          child: Container(
                            height:30,
                            width:210,
                            decoration: BoxDecoration(
                              color:Colors.red,
                              borderRadius: BorderRadius.circular(10 )
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height:12
                    ),
                    Text("Recommended Courses",
                     style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color:Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                    ),
                     SizedBox(
                      height:190,
                      child: ListView.separated(
                        
                        scrollDirection: Axis.horizontal,
                        itemCount:10,
                        separatorBuilder: (context,index){
                          return SizedBox(
                            width:20
                          );
                        },
                        itemBuilder: (context,index){
                        return GestureDetector(
                          onTap:(){
                            
                          },
                          child: Container(
                            height:50,
                            width:210,
                            decoration: BoxDecoration(
                              color:Colors.blue,
                              borderRadius: BorderRadius.circular(16)
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Text("Our Teachers",
                     style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  color:Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     SizedBox(
                      height:190,
                      child: ListView.separated(
                        
                        scrollDirection: Axis.horizontal,
                        itemCount:10,
                        separatorBuilder: (context,index){
                          return SizedBox(
                            width:20
                          );
                        },
                        itemBuilder: (context,index){
                        return GestureDetector(
                          onTap:(){
                            
                          },
                          child: Container(
                            height:50,
                            width:210,
                            decoration: BoxDecoration(
                              color:Colors.yellow,
                              borderRadius: BorderRadius.circular(16)
                            ),
                          ),
                        );
                      }),
                    ),

                  ],
                )
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


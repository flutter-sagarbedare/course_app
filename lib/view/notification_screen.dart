import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState ()=>_NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationScreen>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text("Notifications",
        style:GoogleFonts.montserrat(
          fontSize:30,
          fontWeight:FontWeight.bold
        )),
      ),
     body:Column(
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
                      return Column(
                        children: [
                          Container(
                            // height:100,                        
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Colors.purple,
                            ),
                           child:Padding(
                             padding: const EdgeInsets.all(15.0),
                             child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("New Online Lecture ", style:GoogleFonts.montserrat(
                                                fontSize:19,
                                                fontWeight:FontWeight.w600
                                              )),
                                          // const SizedBox(width:30),
                                        Text("10hr ago"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text("Lecture No 32 - Structure", 
                                    style:GoogleFonts.montserrat(
                                                fontSize:13,
                                                fontWeight:FontWeight.w500
                                              )
                                    ),
                                    // const SizedBox(
                                    //   height: 6,
                                    // ),
                                    Text("Topic - Structure", 
                                    style:GoogleFonts.montserrat(
                                                fontSize:13,
                                                fontWeight:FontWeight.w500
                                              )
                                    ),
                                  ],
                                )
                             
                             
                           
                           ),
                          ),
                        ],
                      );
                    },
                  
                  )
                
              ),
            ),
          ],
        ),
     
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState ()=>_ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{


 @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar:AppBar(
        title:Text("Profile",
        style:GoogleFonts.montserrat(
          fontSize:30,
          fontWeight:FontWeight.bold
        )),
      ),
      // backgroundColor: Colors.blue,
     body:Column(
      children:[
           Row(
                  children: [
                 Icon(Icons.circle,
                 size:120),
                const SizedBox(
                  width:10
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Sagar bedare",
                     style:GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                     )),
                     const SizedBox(height: 10,),
                     Text("Sagaar Nivrutti Bedare",
                      style:GoogleFonts.montserrat(
                      fontSize: 12,
                      color:Colors.grey,
                      fontWeight: FontWeight.w400
                     )),
                     const SizedBox(height: 7,),
                     Text("Golegaon Jalgaon",
                      style:GoogleFonts.montserrat(
                                                color:Color.fromARGB(255, 42, 37, 117),                  

                      fontSize: 12,
                      fontWeight: FontWeight.w400
                     )),
                   ],
                 ),
                  ]
                ),
                const SizedBox(height: 30,),
        Expanded(
          flex:1,
          child:Container(
            decoration: BoxDecoration(
            color:Colors.white,
              borderRadius:BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)) ,
              boxShadow: [
                BoxShadow(
                  color:Colors.black,
                  spreadRadius:1,
                  blurRadius: 20
                )
              ]
            ),
            child:Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: [
                    Text("About",
                      style:GoogleFonts.montserrat(
                        fontSize: 14,
                        color:Color.fromARGB(255, 42, 37, 117),                  

                        fontWeight: FontWeight.bold,
                      )) ,
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(146, 187, 222, 251),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "My Name Is Sagar"
                          ),
                        ),
                      ),


                      Text("Contact",
                      style:GoogleFonts.montserrat(
                        color:Color.fromARGB(255, 42, 37, 117),                  
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )) ,
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(146, 187, 222, 251),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "8669867540"
                          ),
                        ),
                      ),


                    


                      Text("Email ",
                      style:GoogleFonts.montserrat(
                        color:Color.fromARGB(255, 42, 37, 117),                  
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )) ,
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(146, 187, 222, 251),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "sagarbedare@gmail.com"
                          ),
                        ),
                      ),



                      Text("Qualification",
                      style:GoogleFonts.montserrat(
                        color:Color.fromARGB(255, 42, 37, 117),                  
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )) ,
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(146, 187, 222, 251),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "TYBCA"
                          ),
                        ),
                      ),
                      Text("Address",
                      style:GoogleFonts.montserrat(
                        color:Color.fromARGB(255, 42, 37, 117),                  
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )) ,
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(146, 187, 222, 251),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "GOlegaon Khurd Tal Bodwad"
                          ),
                        ),
                      ),
                      Text("Skill and Endoresement",
                      style:GoogleFonts.montserrat(
                        color:Color.fromARGB(255, 42, 37, 117),                  
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )) ,
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(146, 187, 222, 251),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "C C++ Flutter and Dart"
                          ),
                        ),
                      ),
                      Text("Experience",
                      style:GoogleFonts.montserrat(
                        color:Color.fromARGB(255, 42, 37, 117),                  
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )) ,
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(146, 187, 222, 251),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            "2year in TCS"
                          ),
                        ),
                      ),                    
              
                ],
              ),
            )
          ),
        )
      ]
     )
    );
  }
}
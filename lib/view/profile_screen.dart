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
        Expanded(
          flex:1,
          child:Container(
            color:Colors.red,
            child:ListView(
              children: [
                Row(
                  children: [
                 Icon(Icons.circle,
                 size:120),

                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Sagar bedare",
                     style:GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                     )),
                     const SizedBox(height: 10,),
                     Text("TYBCA",
                      style:GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                     )),
                   ],
                 ),
                  ]
                ),
                
                Expanded(
                  flex:1,
                  child: Container(
                    decoration: BoxDecoration(
                      color:Colors.blue
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(),
                    )
                  ),
                ),

              ],
            )
          ),
        )
      ]
     )
    );
  }
}
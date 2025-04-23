
import 'dart:developer';

import 'package:course_app/view/home_screen.dart';
import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar myAppBar(String name,BuildContext context){
  return AppBar(
          title:Row(
            children: [
              Expanded(
                flex:1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text("Hello",
                      style:GoogleFonts.montserrat(
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                        color:Colors.grey,                  
                      )),
                 
                   Text("$name,",
                      style:GoogleFonts.montserrat(
                        fontSize:28,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 42, 37, 117),                  
                      )),
                  ]
                ),
              ),
            ],
          ),
         actions:[
          Image.asset(
            "assets/profile.png"
          ),
          const SizedBox(width:20)
         ]
        );
}
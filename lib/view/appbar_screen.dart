
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar myAppBar(){
  return AppBar(
          title:Expanded(
            flex:1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("Hello,",
                  style:GoogleFonts.montserrat(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                    color:Colors.grey,                  
                  )),
               Text("Sagar,",
                  style:GoogleFonts.montserrat(
                    fontSize:28,
                    fontWeight: FontWeight.bold,
                    color:Color.fromARGB(255, 42, 37, 117),                  
                  )),
              ]
            ),
          ),
         actions:[
          Icon(Icons.circle_outlined,
          color:Colors.red,
          size:60),
          const SizedBox(width:20)
         ]
        );
}
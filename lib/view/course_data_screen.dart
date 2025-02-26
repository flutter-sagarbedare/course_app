import 'package:course_app/view/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CourseDataScreen extends StatelessWidget{

  const CourseDataScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text("Flutter Online"),
      ),
      body:ListView.builder(
        itemCount:10,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return VideoScreen();
              }));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child:Row(
                children: [
                 Image.network("https://th.bing.com/th/id/OIP.gZdVA2Uov4GGRzJc9vXuKAHaEK?rs=1&pid=ImgDetMain",
                 width:200
                 ),
                 const SizedBox(width:30),
                
                      Expanded(
                        child: Text(
                          "01 - Introduction To FLutter",style:GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    )
                        ),
                      ),
                      const SizedBox(width:10),
                      
                  
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
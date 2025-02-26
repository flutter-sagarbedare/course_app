import 'dart:developer';
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:course_app/view/courses_screen.dart';
import 'package:course_app/view/home_screen.dart';
import 'package:course_app/view/notification_screen.dart';
import 'package:course_app/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

enum _SelectedTab { home, favorite, add, search, person }

class LandingScreen extends StatefulWidget{
  const LandingScreen({super.key});

  State createState() => _LandingScreenState();
}

class _LandingScreenState extends State{
  

   int _selectedIndex=0;
  List<dynamic> tabItems = [
    Center(child: Text("0")),
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3")),
    Center(child: Text("4"))
  ];

    // bottom navigation variables and functions
    var _selectedTab = _SelectedTab.home;
    
    void _handleIndexChanged (int a){
      setState((){
        _selectedTab = _SelectedTab.values[a];        
      });
    }


  int currentScreen = 0;


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:
      Scaffold(
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
      //   ),
      //   child: FlashyTabBar(
      //       // backgroundColor: Color.fromARGB(80, 42, 37, 117),
      //       selectedIndex: _selectedIndex,
      //       showElevation: true,
      //       items: [ 
      //           FlashyTabBarItem(
      //             icon: GestureDetector(
      //             onTap:(){
      //               currentScreen = 1;
      //                setState(() {
                      
      //               });  
      //             },
      //               child: Icon(Icons.home),
      //             ),
      //             title: Text('Home'),                
      //             ),
      //           FlashyTabBarItem(
      //             icon: GestureDetector(child: Icon(Icons.play_circle_outlined,
                  
      //             ),
      //             onTap:(){   
      //               currentScreen=2;  
      //                setState(() {
                      
      //               });                
      //               },
      //             ),
      //             title: Text('Courses'),
      //           ),         
      //            FlashyTabBarItem(
      //             icon: GestureDetector(child: Icon(Icons.notification_add_outlined),
      //             onTap:(){
      //               currentScreen=3;    
      //               setState(() {
                      
      //               });          
      //             },
      //             ),
      //             title: Text('Notification'),
      //           ),
               
      //           FlashyTabBarItem(
      //             icon: GestureDetector(child: Icon(Icons.people),
      //             onTap:(){
      //               currentScreen=4;     setState(() {
                      
      //               });                 
      //             },
      //           ),
      //             title: Text('Profile'),
      //           ),
      //         ],
      //       onItemSelected:(index) => setState(() {
      //      _selectedIndex = index;
      //          }),
      //       ),
      
      // ),
   
      extendBody: true,

      bottomNavigationBar:SizedBox(
        width: 100,
        child:CrystalNavigationBar(
         
          margin: EdgeInsets.all(20),
          itemPadding: EdgeInsets.all(10),
          backgroundColor: Colors.black.withOpacity(0.50),
          onTap:
          (index){
             setState((){
        _selectedTab = _SelectedTab.values[index];        
      });
            // _handleIndexChanged;
            setState((){
            currentScreen=index;
            });
          },
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
            ),
            CrystalNavigationBarItem(
              icon: Icons.play_circle_outline,
            ),
            CrystalNavigationBarItem(
              icon: Icons.notification_add,
            ),
            CrystalNavigationBarItem(
              icon: Icons.person_2,
            ),

          ],
          
        
          ),
      ),
    
    body:mainScreen(currentScreen)
  
      ),
    );
  }
}

Scaffold mainScreen(int currentScreen){
  if(currentScreen == 0 ){
      log(" in home screen $currentScreen");
      return Scaffold(
        
        body:HomeScreen()
      );
  }else if(currentScreen == 1){
      log("in courses screen $currentScreen");

return Scaffold(
        body:CoursesScreen()
      );
  }else if(currentScreen == 2){
      log("notification screen $currentScreen");

      return Scaffold(
        body:NotificationScreen()
      );
  }else {
      log("profile screen $currentScreen");

      return Scaffold(
        body:ProfileScreen()
      );
  }

  // switch(currentScreen){
  //   case 1:
  //      return Scaffold(        
  //       body:HomeScreen()
  //     );
    
  //   case 2:
  //      return Scaffold(
        
  //       body:CoursesScreen()
  //     );


  //   case 3:
  //    return Scaffold(
        
  //       body:NotificationScreen()
  //     ); 
    
  //   case 4:
  //      return Scaffold(
        
  //       body:ProfileScreen()
  //     );
    
  //   default:
  //      return Scaffold(
  //     body: 
  //     HomeScreen()
  //      );
  // }
}
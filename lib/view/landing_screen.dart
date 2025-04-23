import 'dart:developer';
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:course_app/main.dart';
import 'package:course_app/view/courses_screen.dart';
import 'package:course_app/view/home_screen.dart';
import 'package:course_app/view/notification_screen.dart';
import 'package:course_app/view/profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:provider/provider.dart';

enum _SelectedTab { home, courses, notification, profile }

class LandingScreen extends StatefulWidget{



  const LandingScreen({super.key});



  @override
  State createState() => _LandingScreenState();

  
}

class _LandingScreenState extends State{

  @override
  void initState(){
    Provider.of<CoreDataItems>(context,listen: false).getUseronTheLoad();
    // setState((){});
    super.initState();
  }
  

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


  int currentScreen =0;

 

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:
      Scaffold(
     
   
      extendBody: true,

      bottomNavigationBar:Container(
        height:70,
        width:30,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          
          borderRadius:BorderRadius.only(topLeft: Radius.circular(17),topRight: Radius.circular(17)),
           boxShadow: [
            BoxShadow(
              color:Colors.black,
              spreadRadius: 1,
              blurRadius: 10
            )
          ],
        ),
        child: CrystalNavigationBar(
         
          curve:Curves.linear,
          // height: 30,
          // splashColor: Colors.redAccent,
          borderRadius: 10,
          enableFloatingNavBar: false,
          margin: EdgeInsets.only(top:0,left: 13,right:13),
          itemPadding: EdgeInsets.all(10),
          // backgroundColor: Colors.black.withOpacity(0.50),
          backgroundColor: Colors.white,
          onTap:
          (index){
            Provider.of<CoreDataItems>(context,listen: false).selectedIndex = index;
             setState((){
        _selectedTab = _SelectedTab.values[index];        
              });
            _handleIndexChanged;
            setState((){
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
    
    body:mainScreen(context)
  
      ),
    );
  }
}

dynamic mainScreen(BuildContext context){
  int currentScreen=Provider.of<CoreDataItems>(context,listen: false).selectedIndex;
  if(currentScreen == 0 ){
      log(" in home screen $currentScreen");
      return Scaffold(
        body:HomeScreen()
        // body:HomeScreen(userId:userId)
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

}
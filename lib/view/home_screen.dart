import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/main.dart';
import 'package:course_app/services/yt_api_services.dart';
import 'package:course_app/view/appbar_screen.dart';
import 'package:course_app/view/course_detail_screen.dart';
import 'package:course_app/view/video_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:course_app/view/database.dart' as db;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
// import 'package:skeletonizer/skeletonizer.dart';



// class GetUserName extends StatelessWidget {
//   final String documentId;
//   const GetUserName({required this.documentId});



//   @override
//   Widget build(BuildContext context) {

//       CollectionReference users =  FirebaseFirestore.instance.collection('Users');

//       return FutureBuilder<DocumentSnapshot>(
//         future:users.doc(documentId).get(),
//         builder: ((context,snapshot){
//           if(snapshot.connectionState == ConnectionState.done){
//         Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic>;


//        return Text("first name :${data['name']}");
//           }
//           return Text("Loading");
//       }
//       ),
//       );
    
// }

// }






class HomeScreen extends StatefulWidget {

  final String? userId;
  const HomeScreen({super.key,this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    Map<String,dynamic> userData = {};

  // Stream? CourseStream;

  getonTheLoad() async {
    print("In the get on the load");
    Provider.of<CoreDataItems>(context, listen: false).CourseStream =
        await db.Database().getCoursesDetails();
    setState(() {});
  }

  // dynamic userData;
  // getUserData()async{
  //   log("In get user data in home sceen");
  //   userData = Provider.of<CoreDataItems>(context,listen: false).fetchUserData();
  //   setState(() {});

  // }

  // testgetuserdata()async{
  //           dynamic user=  Provider.of<CoreDataItems>(context, listen: false).fetchUserData();

          
  // }


  bool _isLoading = true;

  String? userId;
  String userName='';

  String name='';
 
  
  Future<void> getUserName()async{
   
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Users').doc(userId).get();

    if (doc.exists) {
       userName = doc['name']; // Extract the name field

       Provider.of<CoreDataItems>(context,listen: false).setUserName(userName);
       setState((){});
      log("User Name: $userName");
    } else {
      log("No user found with ID: $userId");
    }
  } catch (e) {
    log("Error fetching user: $e");
    }
  }
  // setUserId()async{
    
    
  //   userId = Provider.of<CoreDataItems>(context,listen: false).userId;
  //   log("${Provider.of<CoreDataItems>(context,listen: false).userName}");
  // }

 void fetchName()async{

  userId = Provider.of<CoreDataItems>(context,listen:false).uId;

    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('Users').doc(userId).get();

    Map<String,dynamic> userData = {};

    userData = snapshot.data() as Map<String,dynamic>;

    final prefs = await SharedPreferences.getInstance();

    name = userData['name'];
    
    log("got name from sharedPreference $name");
    log("got id from sharedPreference $userId");
    setState(() {
      
    });  
  }

    void setUserData(){

      userData =  Provider.of<UserInformation>(context,listen:false).userData;
      log("In Home Screen got userdata map from provider");
    }


  @override
  void initState() {
     setUserData();

    // Provider.of<CoreDataItems>(context).getonTheLoad();

    // getUserName();

    // fetchName();
    // log("in the init state of home screen");
      // setUserId();    
    // log("User id in Home screen is $userId ");
    // getUserName();
    getonTheLoad();
    // getUserData();

    setState((){});
    super.initState();
  }

  // String? userId;


  // user data
    // final user = FirebaseAuth.instance.currentUser!;


  //  FutureBuilder<DocumentSnapshot<Object?>> getUserName(){
  //    String uId =  user.uid;
  //    CollectionReference users =  FirebaseFirestore.instance.collection('Users');
  //      FutureBuilder<DocumentSnapshot>(builder: ((context,snapshot){
  //       Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
  //       return Text('${data['name']}');
  //     }), future: null,);
  
  
  //   }


  @override
  Widget build(BuildContext context) {
  // userId = Provider.of<CoreDataItems>(context,listen: false).userId;
 
  
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 244, 253),
        
        appBar: myAppBar(userData['name'],context),
        // backgroundColor: Colors.blue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Text(
                "Coding is All about Exloring...",
                style: TextStyle(color: Colors.grey[600], fontSize: 17),
              ),
            ),
            // const SizedBox(
            //   height:20
            // ),
            Flexible(
              flex: 1,
              // height:MediaQuery.sizeOf(context).height/1.6,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // color:const Color.fromARGB(150, 158, 158, 158),
                  // border: Border.all(color:Colors.red),
                  color: Color.fromARGB(237, 240, 244, 253),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 0.0,
                      blurRadius: 30,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      height: 150,
                      width: 327,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 42, 37, 117),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Your Courses!",
                                style: GoogleFonts.montserrat(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "User Experience Class",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  log(
                                    "${Provider.of<CoreDataItems>(context, listen: false).selectedIndex}",
                                  );
                                  Provider.of<CoreDataItems>(
                                    context,
                                    listen: false,
                                  ).changeIndex(1);
                                },
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        161,
                                        107,
                                        196,
                                      ),
                                      // border: Border.all(color:Colors.red),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "See Courses",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Image.asset("assets/studying.png", height: 84),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending Courses",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            // var  videos =await YtApiServices().getAllVideosFromPlaylist();
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(builder: (context){
                            //     return
                            //  YoutubeHomePage(videos: videos,);
                            //   })
                            // );
                          },
                          child: Text(
                            "See All",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      height: 300,
                      // color:Colors.red,
                      child: trendingCourses(),
                    ),

                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended Courses",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      height: 300,
                      // color:Colors.red,
                      child: trendingCourses(),
                    ),

                    // Text(
                    //   "Our Teachers",
                    //   style: GoogleFonts.montserrat(
                    //     fontSize: 20,
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 300,
                    //   child: ListView.separated(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 10,
                    //     separatorBuilder: (context, index) {
                    //       return SizedBox(width: 20);
                    //     },
                    //     itemBuilder: (context, index) {
                    //       return
                    //       //  GestureDetector(
                    //       //   onTap:(){
                    //       //   },
                    //       //   child: Container(
                    //       //     height:50,
                    //       //     width:210,
                    //       //     decoration: BoxDecoration(
                    //       //       color:Colors.blue,
                    //       //       borderRadius: BorderRadius.circular(16)
                    //       //     ),
                    //       //   ),
                    //       // );
                    //       SizedBox(
                    //         height: 30,
                    //         width: 260,
                    //         child: Column(
                    //           children: [
                    //             Container(
                    //               // height:290,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(20),
                    //                 color: Colors.white,
                    //               ),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,

                    //                 children: [
                    //                   const SizedBox(width: 20),
                    //                   Container(
                    //                     // height:90,
                    //                     // width:90,
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.circular(
                    //                         10,
                    //                       ),
                    //                       // shape: BoxShape.rectangle,
                    //                       color: Colors.black,
                    //                     ),
                    //                     child: Image.asset(
                    //                       'assets/studying.png',
                    //                     ),
                    //                   ),
                    //                   const SizedBox(width: 20),

                    //                   Padding(
                    //                     padding: const EdgeInsets.all(10.0),
                    //                     child: Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text(
                    //                           "Sagar Bedare",
                    //                           style: GoogleFonts.montserrat(
                    //                             fontSize: 16,
                    //                             fontWeight: FontWeight.bold,
                    //                           ),
                    //                         ),
                    //                         const SizedBox(height: 10),
                    //                         Row(
                    //                           children: [
                    //                             Text(
                    //                               "10 Years Teaching Experience",
                    //                               style: GoogleFonts.montserrat(
                    //                                 fontSize: 12,
                    //                                 fontWeight: FontWeight.w600,
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                         const SizedBox(height: 10),
                    //                         Row(
                    //                           children: [
                    //                             Text(
                    //                               "Graduated ",
                    //                               style: GoogleFonts.montserrat(
                    //                                 fontSize: 18,
                    //                                 fontWeight: FontWeight.w600,
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget trendingCourses() {
    log("In treding courses");
    // return  Consumer(
    //   builder:(context,provider,child){
    // log("In treding courses consumer");

    //     return StreamBuilder(

    //   stream:Provider.of<CoreDataItems>(context).CourseStream,
    //   builder: (context,AsyncSnapshot snapshot){
    //        if (snapshot.hasError) {
    //     return Text('Something went wrong');
    //   }

    //   if (snapshot.connectionState == ConnectionState.waiting) {
    //     return Text("Loading");
    //   }

    //     return snapshot.hasData ?
    //     ListView.separated(
    //       separatorBuilder: (context,index){
    //         return SizedBox(
    //           width:10
    //         );
    //       },
    //               physics:BouncingScrollPhysics(),

    //       scrollDirection: Axis.horizontal,

    //       itemCount:snapshot.data.docs.length,
    //       itemBuilder: (context,index){
    //         DocumentSnapshot ds = snapshot.data.docs[index];

    //         // print("Image : ="+ds["imgsrc"]);
    //         // print("Name : ="+ds["Name"]);
    //         // print("Duration : ="+ds["Duration"]);
    //         // print("Price: ="+ds["Price"]);
    //         // print("NoOfLectures ="+ds["NoOfLectures"]);
    //         return  SizedBox(
    //                           height: 30,
    //                           width: 260,
    //                           child: Column(
    //                             children: [
    //                               Container(
    //                                 // height:290,
    //                                 decoration: BoxDecoration(
    //                                   borderRadius: BorderRadius.circular(20),

    //                                   color: Colors.white,
    //                                 ),
    //                                 child: Column(
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.start,

    //                                   children: [
    //                                     GestureDetector(
    //                                       onTap:(){
    //                                         Navigator.of(context).push(
    //                                           MaterialPageRoute(builder:
    //                                           (context){
    //                                             return CourseDetailScreen(ds:ds);
    //                                           })
    //                                         );
    //                                       },
    //                                       child: Column(
    //                                         children: [
    //                                           const SizedBox(width: 20),
    //                                           Container(
    //                                             clipBehavior: Clip.hardEdge,
    //                                             // height:90,
    //                                             // width:90,
    //                                             decoration: BoxDecoration(
    //                                               borderRadius: BorderRadius.circular(
    //                                                 10,
    //                                               ),
    //                                               // shape: BoxShape.rectangle,
    //                                               color: Colors.black,
    //                                             ),
    //                                             child: Image.network(
    //                                              ds["imgsrc"]
    //                                              ,
    //                                             ),
    //                                           ),
    //                                           const SizedBox(width: 20),

    //                                           Padding(
    //                                             padding: const EdgeInsets.all(10.0),
    //                                             child: Column(
    //                                               crossAxisAlignment:
    //                                                   CrossAxisAlignment.start,
    //                                               children: [
    //                                                 Text(
    //                                                   ds["Name"],
    //                                                   style: GoogleFonts.montserrat(
    //                                                     fontSize: 16,
    //                                                     fontWeight: FontWeight.bold,
    //                                                   ),
    //                                                 ),
    //                                                 const SizedBox(height: 10),
    //                                                 Row(
    //                                                   children: [
    //                                                     Text(
    //                                                       "${ds["NoOfLectures"]} Lectures   Total ${ds["Hours"]}hr    ${ds["Duration"] } Months",
    //                                                       style: GoogleFonts.montserrat(
    //                                                         fontSize: 12,
    //                                                         fontWeight: FontWeight.w600,
    //                                                       ),
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                                 const SizedBox(height: 10),
    //                                                 Row(
    //                                                   children: [
    //                                                     Text(
    //                                                       "${ds["Price"]}/- rs ",
    //                                                       style: GoogleFonts.montserrat(
    //                                                         fontSize: 18,
    //                                                         fontWeight: FontWeight.w600,
    //                                                       ),
    //                                                     ),
    //                                                   ],
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           ),
    //                                           GestureDetector(
    //                                             onTap: () {},
    //                                             child: Container(
    //                                               height: 40,
    //                                               decoration: BoxDecoration(
    //                                                 color: Colors.blue,
    //                                                 borderRadius: BorderRadius.circular(
    //                                                   13,
    //                                                 ),
    //                                               ),
    //                                               child: Center(child: Text("Buy Now")),
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         );

    //                     },
    //                   ) : Container(
    //                         // color:Colors.red,

    //                         );
    //   }

    //                 );
    //   }
    // );

    // 2nd way

    return Consumer(
      builder: (context, provider, child) {
        return
         StreamBuilder<List<Map<String, dynamic>>>(
          stream:
              Provider.of<CoreDataItems>(context, listen: false).fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            }

            final dataList = snapshot.data!;

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dataList.length,
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              },
              itemBuilder: (context, index) {
                final course = dataList[index];

                return  SizedBox(
                    height: 30,
                    width: 260,
                    child: Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          height:140,
                          width:250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                  
                            // borderRadius: BorderRadius.circular(
                            //   10,
                            // ),
                            // shape: BoxShape.rectangle,
                            color: Colors.black,
                          ),
                          child: Image.network(course["imgsrc"], fit:BoxFit.contain),
                        ),
                  
                        Container(
                          // height:290,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                  
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                  
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CourseDetailScreen(ds: course);
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    const SizedBox(width: 20),
                  
                                    const SizedBox(width: 20),
                  
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course["Name"],
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "${course["NoOfLectures"]} Lectures   Total ${course["Hours"]}hr    ${course["Duration"]} Months",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "${course["Price"]}/- rs ",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                          Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CourseDetailScreen(ds: course);
                                      },
                                    ),
                                  );
                                       
                                      },
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(13),
                                        ),
                                        child: Center(child: Text("Buy Now")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                

                //  SizedBox(
                //                   height: 30,
                //                   width: 260,
                //                   child: Column(
                //                     children: [
                //                       Container(
                //                         // height:290,
                //                         decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(20),

                //                           color: Colors.white,
                //                         ),
                //                         child: Column(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.start,

                //                           children: [
                //                             GestureDetector(
                //                               onTap:(){
                //                                 Navigator.of(context).push(
                //                                   MaterialPageRoute(builder:
                //                                   (context){
                //                                     return CourseDetailScreen(ds:course);
                //                                   })
                //                                 );
                //                               },
                //                               child: Column(
                //                                 children: [
                //                                   const SizedBox(width: 20),
                //                                   Container(
                //                                     clipBehavior: Clip.hardEdge,
                //                                     // height:90,
                //                                     // width:90,
                //                                     decoration: BoxDecoration(
                //                                       borderRadius: BorderRadius.circular(
                //                                         10,
                //                                       ),
                //                                       // shape: BoxShape.rectangle,
                //                                       color: Colors.black,
                //                                     ),
                //                                     child: Image.network(
                //                                      course["imgsrc"]
                //                                      ,
                //                                     ),
                //                                   ),
                //                                   const SizedBox(width: 20),

                //                                   Padding(
                //                                     padding: const EdgeInsets.all(10.0),
                //                                     child: Column(
                //                                       crossAxisAlignment:
                //                                           CrossAxisAlignment.start,
                //                                       children: [
                //                                         Text(
                //                                           course["Name"],
                //                                           style: GoogleFonts.montserrat(
                //                                             fontSize: 16,
                //                                             fontWeight: FontWeight.bold,
                //                                           ),
                //                                         ),
                //                                         const SizedBox(height: 10),
                //                                         Row(
                //                                           children: [
                //                                             Text(
                //                                               "${course["NoOfLectures"]} Lectures   Total ${course["Hours"]}hr    ${course["Duration"] } Months",
                //                                               style: GoogleFonts.montserrat(
                //                                                 fontSize: 12,
                //                                                 fontWeight: FontWeight.w600,
                //                                               ),
                //                                             ),
                //                                           ],
                //                                         ),
                //                                         const SizedBox(height: 10),
                //                                         Row(
                //                                           children: [
                //                                             Text(
                //                                               "${course["Price"]}/- rs ",
                //                                               style: GoogleFonts.montserrat(
                //                                                 fontSize: 18,
                //                                                 fontWeight: FontWeight.w600,
                //                                               ),
                //                                             ),
                //                                           ],
                //                                         ),
                //                                       ],
                //                                     ),
                //                                   ),
                //                                   GestureDetector(
                //                                     onTap: () {},
                //                                     child: Container(
                //                                       height: 40,
                //                                       decoration: BoxDecoration(
                //                                         color: Colors.blue,
                //                                         borderRadius: BorderRadius.circular(
                //                                           13,
                //                                         ),
                //                                       ),
                //                                       child: Center(child: Text("Buy Now")),
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 );
              },
            );
          },
        );
      },
    );

    // 3rd
    //   return
    //           ListView.builder(
    //               itemCount: courses.length,
    //               itemBuilder: (context, index) {
    //                 final course = courses[index];
    //                 return Card(
    //                   margin: EdgeInsets.all(8),
    //                   child: ListTile(
    //                     // leading: Image.network(
    //                     //   course['imgsrc'] ?? '',
    //                     //   width: 50,
    //                     //   height: 50,
    //                     //   fit: BoxFit.cover,
    //                     // ),
    //                     title: Text(course['Name'] ?? 'No Name'),
    //                     subtitle: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text('Price: ${course['Price']}'),
    //                         Text('Duration: ${course['Duration']} weeks'),
    //                         Text('Hours: ${course['Hours']} hours'),
    //                         Text('Lectures: ${course['NoOfLectures']} lectures'),
    //                       ],
    //                     ),
    //                     trailing: Text('ID: ${course["Id"]}'),
    //                   ),
    //                 );
    //               },
    //             );

    // }
  }
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/const/app_const.dart';
import 'package:course_app/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailScreen extends StatefulWidget {
  final ds;

  CourseDetailScreen({super.key, required this.ds});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  _CourseDetailScreenState();

  dynamic userId;
  

  void buyCourse()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    userId = prefs.getString('userId');
   log("$userId");
   log("${widget.ds["Id"]}");

     await FirebaseFirestore.instance.collection('Users').doc(userId).update(
          {
           
            'courses_own':FieldValue.arrayUnion([widget.ds["Id"]]) 
          }
        );
                            displaySnackBar(context, "Congratulations!!");
        

        // Navigator.of(context).pop();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        label: SizedBox(
          width: 300,
          child: Center(
            child: Text(
              "Buy Now",
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context){
          //     return Dialog(

          //     );
          //   })
          // );
          showDialog(context: context, builder: (context){
              return Dialog(
                backgroundColor: Colors.white,
                child:SizedBox(
                  height: 200,
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Do you want to Buy Course??",
                        style:GoogleFonts.montserrat(
                          fontSize:20
                        )
                        ),
                    
                        Row(children: [
                          ElevatedButton(onPressed: (){
                            
                            buyCourse();
        Navigator.of(context).pop((){

        });
                          }, 
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.green),
                            
                          ),
                          child: Center(
                            child:Row(
                              children: [
                                Text("Buy",
                                style:GoogleFonts.montserrat(
                                  color: Colors.white
                                )
                                ),
                                const SizedBox(width: 10,),
                                Icon(Icons.get_app,
                                color: Colors.white,)
                              ],
                            )
                          ),
                          ),
                          const SizedBox(width: 30,),
                          ElevatedButton(onPressed: (){
        Navigator.of(context).pop();

                          }, 
                          child: Center(
                            child:Text("Cancel")
                          ),
                          ),
                          
                    
                        ],
                        
                        ),
                        
                      ],
                    ),
                  ),
                )
              );
          });
          // buyCourse();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(title: Text("${widget.ds["Name"]}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.ds["Name"]}" + " Course",
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "2025 Exclusive Course for Flutter using Dart",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.lock_clock),
                    const SizedBox(width: 5),
                    Text(
                      "Course Duration - ${widget.ds["Hours"]} Hrs",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    const SizedBox(width: 5),
                    Text(
                      "Course Validity - ${widget.ds["Duration"]} Months",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Image.network(widget.ds['imgsrc']),
                const SizedBox(height: 14),

                Row(
                  children: [
                    Icon(Icons.book),
                    const SizedBox(width: 5),
                    Text(
                      "Syllabus",
                      style: GoogleFonts.montserrat(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  // color:Colors.red,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20);
                    },
                    itemCount: widget.ds['Syllabus_topics'].length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        //  height:30,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 3,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(Icons.star_half),
                              const SizedBox(width: 10),
                              Text("${widget.ds['Syllabus_topics'][index]}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

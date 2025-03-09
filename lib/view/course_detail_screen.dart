import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetailScreen extends StatefulWidget {
  DocumentSnapshot<Object?> ds;

  CourseDetailScreen({super.key, required this.ds});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  _CourseDetailScreenState();

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

        onPressed: () {},
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
                    itemCount: 20,
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
                              Text("Topic 1"),
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

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';


// class TestResult extends StatefulWidget {
//   List? test2= [];
//    TestResult({super.key,this.test2});

//   @override
//   State<TestResult> createState() => _TestResultState();
// }

// class _TestResultState extends State<TestResult> {

 
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body:Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('${widget.test2}'),
//           // Text(widget.test2![0]),
//           // const SizedBox(height: 10,),
//           // Text(widget.test2![1]),
//           // const SizedBox(height: 10,),
//           // Text(widget.test2![2]),
//           // const SizedBox(height: 10,),

//         ]
//       ),
//     );
//   }
// }





class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {

    getonTheLoad()async{
    print("In the get on the load");

        CourseStream = await getCoursesDetails();
       setState((){});
    }

    @override
      void initState(){
      getonTheLoad();
      super.initState();
    }

  List<Model> tests = [];

  Future<Stream<QuerySnapshot>> getCoursesDetails()async{
    print("In the get data");

    return await FirebaseFirestore.instance.collection("Studee123").snapshots();
  }


  Future AddCourseDetails(Map<String,dynamic> courseInfoMap,String id)async{
    print("In the add data");
    return await FirebaseFirestore.instance.collection('Studee123').doc(id).set(courseInfoMap);
  }

  Stream? CourseStream;

  Widget ShowCoursesInfo(){
    return StreamBuilder(
      stream:CourseStream,
      builder: (context,AsyncSnapshot snapshot){
        return snapshot.hasData ? 
        ListView.builder(
          itemCount:snapshot.data.docs.length,
          itemBuilder: (context,index){
            DocumentSnapshot ds = snapshot.data.docs[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color:Colors.yellow,
                child:Center(
                  child: Column(
                    children: [
                      Text(ds["Name"]),
                      const SizedBox(height: 20,),
                      Text(ds["Price"]),
                      const SizedBox(height: 20,),
                      Text(ds["Hours"]),
                      const SizedBox(height: 20,),
                      Text(ds["Duration"]),
                      const SizedBox(height: 20,),
                      Text(ds["NoOfLectures"]),
                      const SizedBox(height: 20,),
                      Image.network(ds["imgsrc"],scale: 3,)
                      // Image.network("https://cdn.ostad.app/course/photo/2024-12-18T15-22-42.948Z-Flutter-Thumbnail.jpg",scale: 3,)
                    ],
                  ),
                ),
              ),
            );

        }) : Container();
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {    
                  String Id = randomAlphaNumeric(10);
                  Map<String,dynamic> courseInfoMap = {
                      "Name":"Python",
                      "Price":"9000",
                      "Duration":"5",
                      'Hours':'100',
                      'NoOfLectures':'95',
                      "Id":Id,
                      "imgsrc":"https://img-c.udemycdn.com/course/750x422/2314160_8d61_6.jpg"
                  };
                  AddCourseDetails(courseInfoMap,Id);
                },
                child: Text("add data"),
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(child: ShowCoursesInfo()),

        ],
      ),
    );
  }
}

class Model {
  dynamic courseData;

  Model({required this.courseData});
}

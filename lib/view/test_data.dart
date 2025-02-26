import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/view/test_result.dart';
import 'package:flutter/material.dart';


class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {

  List<Model> tests = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: ElevatedButton(
            onPressed: ()async{
              Map<String,dynamic> data={
              'course1':[
                  'Flutter',
                '40',
                '10000'
              ],
              'course2':[
                  'Java',
                '30',
                '10000'
              ],
              'course3':[
                  'Python',
                '50',
                '10000'
              ],
              'course4':[
                  'C',
                '40',
                '70000'
              ],
              'course5':[
                  'C++',
                '40',
                '10000'
              ],
             
              
              };
              log("$data");
              await FirebaseFirestore.instance.collection('test').add(data);
            },
            child:Text("add data"),
          ),
        
        ),
          const SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: ()async{
              
             QuerySnapshot response = await FirebaseFirestore.instance.collection('test').get();

             tests.clear();
             log(
              "in get data"
             );
            //  print(tests);
             print(tests[0].courseData);


             for(int i =0;i<response.docs.length;i++){
                log("$response.docs[i]['course_name']");
                // log(" ans  $response.docs[i]['courseDuration']");
                // log("$response.docs[i]['course_price']");
                // log("");
                tests.add(
                  Model(
                   courseData: response.docs[i],
                  )
                );

                // print(tests);
             }
            //  print(response.docs[0]['course1']);

              // print(tests);
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context){
              //     return TestResult(test2: tests);
              //   })
              // );   
              // for(int i = 0;i<tests.length;i++){
              //   for(int j =0;j<3;j++){
              //     log(tests[i][j]);
              //   }
              // }
            },
            child:Text("get data"),
          ),

        ]
      ),
    );
  }
}


class Model{
  dynamic courseData;

   Model({
    required this.courseData,
    
  });

}
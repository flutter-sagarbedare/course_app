import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class TestResult extends StatefulWidget {
  List? test2= [];
   TestResult({super.key,this.test2});

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {

 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${widget.test2}'),
          // Text(widget.test2![0]),
          // const SizedBox(height: 10,),
          // Text(widget.test2![1]),
          // const SizedBox(height: 10,),
          // Text(widget.test2![2]),
          // const SizedBox(height: 10,),

        ]
      ),
    );
  }
}



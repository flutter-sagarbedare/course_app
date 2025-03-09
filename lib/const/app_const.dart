import 'package:flutter/material.dart';

class ApiKey{
  static const String api_key = "AIzaSyAEXZSGhsQ-St7smhDyjhgej24VzOjyjIo";

   
}


void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
}
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(80, 42, 37, 117),
      body:Padding(
        padding:EdgeInsets.only(top:20,left:50,right:50),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
        
                const SizedBox(height:58),
                Image.asset("assets/amico.png",),
                const SizedBox(height:40),
          ]
        ),
      )    
    );
  }
}
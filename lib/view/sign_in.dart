import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/const/app_const.dart';
import 'package:course_app/main.dart';
import 'package:course_app/services/loc_database.dart';
import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/sign_up.dart';
import 'package:course_app/view/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  // Future signIn()async{
  //   // if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty ){
  //   log("before sending login data");
  //   try{
  //     log("in try part");
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email:_emailController.text.trim() ,
  //      password: _passwordController.text.trim());

  //      Provider.of(context).userEmail = _emailController.text.trim();
  //   }on FirebaseAuthException catch (e){
  //     log("in catch part: $e");
  //     setState((){

  //     displaySnackBar(context, "$e");
  //     });

    
  //   }
  //   // log("before sending login data");

  //   // }else{
  //   //   log("not sending data");
  //   // }
  // }
  dynamic userId;
  dynamic name;

    void checkValidUser()async{

        final pref = await SharedPreferences.getInstance();

         userId = pref.getString('userId'); 
         name = pref.getString('name');

         Map<String,dynamic> userdata={};

      log('$userId in sign in screen');

    DocumentSnapshot doc = await FirebaseFirestore.instance.collection("Users").doc(userId).get();

    userdata = doc.data() as Map<String,dynamic>;

    if(userdata['email'] == _emailController.text.trim() ){
      log('userform and signin email matched');

        signIn();
    }
    
  

    }

    void getUserForm(){

      

    }

    Future signIn() async {


    
      if(_emailController.text.trim().isNotEmpty && _passwordController.text.trim().isNotEmpty){
      
      try{
       UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
        displaySnackBar(context, "Login SuccessFully!!");

          String uid = result.user!.uid;
      log('Sign In = $uid');
      Provider.of<CoreDataItems>(context,listen:false).setUId(uid);

      
      DocumentSnapshot docs = await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      Provider.of<UserInformation>(context,listen:false).userData = docs.data() as Map<String,dynamic>;
      log("User data from SignIn map set in provider"); 

      presavelocaldata(true,uid);
      log("email and password matched");

    
     

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

        return LandingScreen();
      }));
      }on FirebaseAuthException catch(ex){
        displayNSnackBar(context, ex.message!);
      } 
      }
      else{
        displayNSnackBar(context, "Enter All Credentials");        
      }      
  
  }



  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(child: 
      Center(
        child:SingleChildScrollView(
          child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.phone_android,
              size: 100,
              ),
              const SizedBox(height:75),
              Text("Hello Again!",
              style:GoogleFonts.bebasNeue(
                fontSize:52,
              )
              ),
              const SizedBox(height:10),
              Text("WelCome Back, you\'ve been missed!",
              style:GoogleFonts.bebasNeue(
                fontSize:20
              )
              ),
              const SizedBox(height:50),
              
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 25),
                child:Container(
                  decoration: BoxDecoration(
                    color:Colors.grey[200],
                    border: Border.all(color:Colors.white),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter email",
                         enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.white),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        fillColor: Colors.grey[200],
                        filled: true
                      ),
                    ),
                  )
                
                ),
          
              const SizedBox(height:20),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 25),
                child:Container(
                  decoration: BoxDecoration(
                    color:Colors.grey[200],
                    border: Border.all(color:Colors.white),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        
                        border: InputBorder.none,
                        hintText: "Enter Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.white),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.deepPurpleAccent),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        fillColor: Colors.grey[200],
                        filled: true
                      ),
                      
                    ),
                  
                )
                ),
          
              const SizedBox(height:20),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap:(){
                    // checkValidUser();
                    signIn();
                    Provider.of<CoreDataItems>(context,listen:false).setEmail(_emailController.text.trim());
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context){
                    //     return LandingScreen();
                    //   })
                    // );
                  },
                  child:Container(
                    height: 60,
                    decoration: BoxDecoration(
                    color:Colors.deepPurpleAccent[400],
                    borderRadius: BorderRadius.circular(12)
                    ),
          
                    child:Center(
                      child: Text("Sign In",
                      style: TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      ),
                    )
                  )
                ),
              ),
              const SizedBox(height:20),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?",
              style:TextStyle(
                fontWeight: FontWeight.bold
              )
          
                  ),
              const SizedBox(width:2),
              GestureDetector(
                onTap: (){
                  // signIn();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return SignUp();
                    })
                  );
                  
                },
                child: Text("Register Now",
                style:TextStyle(
                  color:Colors.deepPurpleAccent[400],
                  fontWeight: FontWeight.bold
                          
                )
                ),
              )
          
                ],
              )
          
          ],),
        )
      ))
    );
  }
}
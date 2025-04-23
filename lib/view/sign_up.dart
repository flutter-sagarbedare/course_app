import 'package:course_app/services/loc_database.dart';
import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/sign_in.dart';
import 'package:course_app/view/user_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:course_app/const/app_const.dart';
import 'package:course_app/main.dart';
import 'package:course_app/view/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

final TextEditingController _nameController = TextEditingController();

 final TextEditingController _contactController = TextEditingController();

 final TextEditingController _addressController = TextEditingController();

 final TextEditingController _educationController = TextEditingController();

 final TextEditingController _skillController = TextEditingController();

 final TextEditingController _experienceController = TextEditingController();

               
  Future signUp() async {
    
      if(_emailController.text.trim().isNotEmpty && _passwordController.text.trim().isNotEmpty){
        if(isPasswordConfirmed()){
      try{
        Provider.of<CoreDataItems>(context,listen:false).setEmail(_emailController.text.trim());
    UserCredential result =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      String uid = result.user!.uid;
      log('Sign Up = $uid');
      Provider.of<CoreDataItems>(context,listen:false).setUId(uid);

        displaySnackBar(context, "Done");        
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:(context){
              return UserDataForm();
            }
          )
        );

      }on FirebaseAuthException catch(ex){
        displayNSnackBar(context, ex.message!);
      } }else{
        displayNSnackBar(context, "Password Not Matched");        
      }
      }else{
        displayNSnackBar(context, "Enter Credentials");        
      }
      
  
  }

  bool isPasswordConfirmed() {
    if (_passwordController.text.trim().isNotEmpty &&
        _confirmpasswordController.text.trim().isNotEmpty) {

      if (_passwordController.text.trim() ==
          _confirmpasswordController.text.trim()) {
            setState(() {
      });
        return true;
      } else {
       
        return false;
      }
    } else {
      setState((){

     displaySnackBar(context,"Password not matched");
      });
      return false;
    }
  }

 


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone_android, size: 100),
                const SizedBox(height: 75),
                Text("Hello !", style: GoogleFonts.bebasNeue(fontSize: 52)),
                const SizedBox(height: 10),
                Text(
                  "WelCome Buddy!!!",
                  style: GoogleFonts.bebasNeue(fontSize: 20),
                ),
                const SizedBox(height: 50),

                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter email",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurpleAccent,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      // displaySnackBar(context, )
                      signUp();
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent[400],
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 2),
                    GestureDetector(
                      onTap: () {
                        // signUp();

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SignIn();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Sign in Now",
                        style: TextStyle(
                          color: Colors.deepPurpleAccent[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

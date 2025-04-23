import 'dart:developer';

import 'package:course_app/const/app_const.dart';
import 'package:course_app/main.dart';
import 'package:course_app/services/loc_database.dart';
import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
// import 'package:firebasefirestore'

class UserDataForm extends StatefulWidget {
  const UserDataForm({super.key});

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
 final TextEditingController _nameController = TextEditingController();

 final TextEditingController _contactController = TextEditingController();

 final TextEditingController _addressController = TextEditingController();

 final TextEditingController _educationController = TextEditingController();

 final TextEditingController _skillController = TextEditingController();

 final TextEditingController _experienceController = TextEditingController();



    void submitUserData()async{
                String Id=Provider.of<CoreDataItems>(context,listen:false).uId;
      
      if(_nameController.text.trim().isNotEmpty && _contactController.text.trim().isNotEmpty && _addressController.text.trim().isNotEmpty && _educationController.text.trim().isNotEmpty && _skillController.text.trim().isNotEmpty && _experienceController.text.trim().isNotEmpty){
        try{

        await FirebaseFirestore.instance.collection('Users').doc(Id).set(
          {
            'Id':Id,
            'name':_nameController.text.trim(),
            'contact_number':_contactController.text.trim(),
            'address':_addressController.text.trim(),
            'education_qualification':_educationController.text.trim(),
            'skills':_skillController.text.trim(),
            'experince':_experienceController.text.trim(),
            'courses_own':[],
            'email':Provider.of<CoreDataItems>(context,listen:false).userEmail,
          }
        );
        // Provider.of<CoreDataItems>(context,listen:false).setUId(Id);
        log('id is set to provider');

        
        
        displaySnackBar(context, "Done");        
         Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context){
                        return SignIn();
                      }
                    ));

        }catch(ex){
        displaySnackBar(context, ex.toString());        
        }
    }
    else{
        displaySnackBar(context, "Enter All Credentials"); 
    }
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child:Center(
          child:SingleChildScrollView(
            child:Column(
              mainAxisAlignment:MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Icon(Icons.phone_android, size: 100),
                const SizedBox(height: 25),
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Name",
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
                      keyboardType: TextInputType.phone,
                      controller: _contactController,
                      
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Contact Number",
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
                ),const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Address",
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
                ),const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _educationController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Education Qualification",
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
                ),const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _skillController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Skills",
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
                      controller: _experienceController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Experiences",
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

              const SizedBox(height:20),

                
           Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap:(){
                    submitUserData();
                   
                  },
                  child:Container(
                    height: 60,
                    decoration: BoxDecoration(
                    color:Colors.deepPurpleAccent[400],
                    borderRadius: BorderRadius.circular(12)
                    ),
          
                    child:Center(
                      child: Text("Submit",
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
          

              ],)
          )
        ) ,)
    );
  }
}
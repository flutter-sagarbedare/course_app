import 'package:course_app/view/landing_screen.dart';
import 'package:course_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:course_app/view/sign_up.dart';
import 'package:course_app/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAccountCreated = false;
  bool showPassword=false;
  
  dynamic myLoginBottomSheet(BuildContext context,bool doLogin) {
    if(isAccountCreated || doLogin){
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return  Form(
          child: Padding(
            padding:  EdgeInsets.only(top:2.0,left:2,right:2, bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[              
                      Container(                   
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50),)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(top:30.0,left:24,right:24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                          
                            Text("Hello,",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color:Color.fromARGB(120, 39, 35, 35),
              
                            ),),
                            const SizedBox(
                              height:8
                            ),
              
                            Text("Welcome,",
                            style: GoogleFonts.montserrat(
                              fontSize: 28,
                              color:Color.fromARGB(255, 39, 35, 35),
                              fontWeight: FontWeight.bold
                            ),),
                          const SizedBox(
                              height:24
                            ),
                            Container(
                              decoration: BoxDecoration(                       
              
                                border: Border.all(color: Colors.purple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.only(top:2.0,bottom:2,left:14,right:14),
                                child: TextField(
                                  decoration:InputDecoration(                            
                                    border: InputBorder.none,
                                    hintText: "Enter Your Email"
                                    // fillColor: const Color.fromARGB(103, 96, 125, 139),
                                    // filled:true,
                                  )
                                ),
                              )
                            ),
                          const SizedBox(
                              height:24
                            ),
                            Container(
                              decoration: BoxDecoration(                       
              
                                border: Border.all(color: Colors.purple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.only(top:2.0,bottom:2,left:14,right:14),
                                child: TextField(
                                  decoration:InputDecoration(                            
                                    border: InputBorder.none,
                                    hintText: "Enter Password"
            
                                    // fillColor: const Color.fromARGB(103, 96, 125, 139),
                                    // filled:true,
                                  )
                                ),
                              )
                            ),
                            const SizedBox(
                              height:8
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Text("Forgot Password?",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color:Color.fromARGB(255, 42, 37, 117),
                            fontWeight: FontWeight.w600
                          ),),
                           
            
                            
                        ]
                      ), const SizedBox(
                              height:9
                            ),
                      
                       GestureDetector(
                        onTap:(){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                            return LandingScreen();
                          }));

                        },
                        child:Container(
                          height:60,
                          width:370,
                          decoration:BoxDecoration(
                            color:Color.fromARGB(255, 42, 37, 117),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child:Center(child: Text(
                            "Log In",
                            style:GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color:Colors.white
                            )
                          ),)
                        ),
                      ),
                      const SizedBox(
                              height:40
                            ),
                          ],
                          ),
                        ),
                      ),
                     
                ]
              ),
          ),
        );
      },
    );
    }else{
      return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return  Form(
          child: Padding(
            padding:  EdgeInsets.only(top:2.0,left:2,right:2, bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[              
                      Container(                   
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50),)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(top:30.0,left:24,right:24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                          
                            Text("Hello,",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color:Color.fromARGB(120, 39, 35, 35),
              
                            ),),
                            const SizedBox(
                              height:8
                            ),
              
                            Text("Welcome,",
                            style: GoogleFonts.montserrat(
                              fontSize: 28,
                              color:Color.fromARGB(255, 39, 35, 35),
                              fontWeight: FontWeight.bold
                            ),),
                          const SizedBox(
                              height:24
                            ),
                            Container(
                              decoration: BoxDecoration(                       
              
                                border: Border.all(color: Colors.purple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.only(top:2.0,bottom:2,left:14,right:14),
                                child: TextField(
                                  decoration:InputDecoration(                            
                                    border: InputBorder.none,
                                    hintText: "Enter Your Name"
                                    // fillColor: const Color.fromARGB(103, 96, 125, 139),
                                    // filled:true,
                                  )
                                ),
                              )
                            ),
                          const SizedBox(
                              height:24
                            ),
                            Container(
                              decoration: BoxDecoration(                       
              
                                border: Border.all(color: Colors.purple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.only(top:2.0,bottom:2,left:14,right:14),
                                child: TextField(
                                  decoration:InputDecoration(                            
                                    border: InputBorder.none,
                                    hintText: "Enter Your Email"
                                    // fillColor: const Color.fromARGB(103, 96, 125, 139),
                                    // filled:true,
                                  )
                                ),
                              )
                            ),
                          const SizedBox(
                              height:24
                            ),
                            Container(
                              decoration: BoxDecoration(                       
              
                                // border: Border.all(color: Colors.purple),
                                border: Border.all(color: Colors.purple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.only(top:2.0,bottom:2,left:14,right:14),
                                child: TextField(
                                  decoration:InputDecoration(                            
                                    border: InputBorder.none,
                                    hintText: "Enter Password",
                                  suffixIcon:
                                  GestureDetector(
                                    onTap:(){
                                 
                                    },
                                    child:Icon(Icons.remove_red_eye),
                                    ),
            
                                    // fillColor: const Color.fromARGB(103, 96, 125, 139),
                                    // filled:true,
                                  )
                                ),
                              )
                            ),
                            const SizedBox(
                              height:8
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          Text("Forgot Password?",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color:Color.fromARGB(255, 42, 37, 117),
                            fontWeight: FontWeight.w600
                          ),),
                           
            
                            
                        ]
                      ), const SizedBox(
                              height:9
                            ),
                      
                       GestureDetector(
                        onTap:(){
                          Navigator.of(context).pop();
                          myLoginBottomSheet(context, true);
                        },
                        child:Container(
                          height:60,
                          width:370,
                          decoration:BoxDecoration(
                            color:Color.fromARGB(255, 42, 37, 117),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child:Center(child: Text(
                            "Create An Account",
                            style:GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color:Colors.white
                            )
                          ),)
                        ),
                      ),
                      const SizedBox(
                              height:40
                            ),
                          ],
                          ),
                        ),
                      ),
                     
                ]
              ),
          ),
        );
      },
    );
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 42, 37, 117),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 50, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 58),
              Image.asset("assets/amico.png"),
              const SizedBox(height: 40),
        
            
              Column(
                children: [
                  Text(
                    "Studee",
                    style: GoogleFonts.montserrat(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
        
                  Text(
                    "Learn easy and fast with Studee Watch video learning anytime",
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
        
                  const SizedBox(height: 48),


                  GestureDetector(
                    onTap:(){},
                    child:Center(
                      child:Text(
                        "Let's Get Started",

                        style:GoogleFonts.montserrat(
                          fontSize:14,
                          fontWeight:FontWeight.w600,
                      )
                      )
                    )
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     print("in sign in button");
                  //     //  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //     //    return LoginScreen();
                  //     //  }));
                  //     // myBottomSheet(context);
                  //     myLoginBottomSheet(context,true);

                  //     setState(() {});
                  //   },
                  //   child: Container(
                  //     height: 60,
                  //     width: 370,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "Sign In",
                  //         style: GoogleFonts.montserrat(
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
        
                  // const SizedBox(height: 16),
        
                  // GestureDetector(
                  //   onTap: () {
                  //     print("in sign up button");
                  //     myLoginBottomSheet(context,false);

                  //     //  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //     //    return SignUp();
                  //     //  }));
                  //   },
                  //   child: Container(
                  //     height: 60,
                  //     width: 370,
                  //     decoration: BoxDecoration(
                  //       color: Color.fromRGBO(255, 255, 255, 0.582),
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "Sign Up",
                  //         style: GoogleFonts.montserrat(
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

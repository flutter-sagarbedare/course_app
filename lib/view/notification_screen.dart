import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget{
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState ()=>_NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationScreen>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Text("Notifications",
        style:GoogleFonts.montserrat(
          fontSize:30,
          fontWeight:FontWeight.bold
        )),
      ),
     body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                
                   padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color:const Color.fromARGB(150, 158, 158, 158),
                    // border: Border.all(color:Colors.red),
                color: Color.fromARGB(255, 240, 244,253),
              
                    boxShadow: [
                      BoxShadow(
                        color:Colors.black,
                        spreadRadius: 0.0,
                        blurRadius: 30,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(30),
                      topRight:Radius.circular(30),
                      )
                  ),
                child:ListView.separated(
                  physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    separatorBuilder: (context,index){
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(builder: (context){
                              //     return Sorry();
                              //   })
                              // );
                            },
                            child: Container(
                              // height:100,                        
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:Colors.purple,
                              ),
                             child:Padding(
                               padding: const EdgeInsets.all(15.0),
                               child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        // crossAxisAlignment: CrossAxisAlignment,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("New Online Lecture ", style:GoogleFonts.montserrat(
                                                  fontSize:19,
                                                  fontWeight:FontWeight.w600
                                                )),
                                            // const SizedBox(width:30),
                                          Text("10hr ago"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text("Lecture No 32 - Structure", 
                                      style:GoogleFonts.montserrat(
                                                  fontSize:13,
                                                  fontWeight:FontWeight.w500
                                                )
                                      ),
                                      // const SizedBox(
                                      //   height: 6,
                                      // ),
                                      Text("Topic - Structure", 
                                      style:GoogleFonts.montserrat(
                                                  fontSize:13,
                                                  fontWeight:FontWeight.w500
                                                )
                                      ),
                                    ],
                                  )
                               
                               
                             
                             ),
                            ),
                          ),
                        ],
                      );
                    },
                  
                  )
                
              ),
            ),
          ],
        ),
     
    );
  }
}


class Sorry extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:SizedBox(
        width:MediaQuery.of(context).size.width,
        child:ListView(
        children: [
          Image.network("https://res.cloudinary.com/teepublic/image/private/s--xFQ73gkM--/t_Resized%20Artwork/c_fit,g_north_west,h_954,w_954/co_fac2cd,e_outline:48/co_fac2cd,e_outline:inner_fill:48/co_ffffff,e_outline:48/co_ffffff,e_outline:inner_fill:48/co_bbbbbb,e_outline:3:1000/c_mpad,g_center,h_1260,w_1260/b_rgb:eeeeee/t_watermark_lock/c_limit,f_auto,h_630,q_auto:good:420,w_630/v1599197568/production/designs/13688768_0.jpg"),
          // const SizedBox(height:2),
          Image.asset("assets/vs.jpg",scale:2),
          // const SizedBox(height:2),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              // "First of all Thank You so much Chandraaaa❤️🙏.. I am really very Sorry Dear💜...I will not do any mistake again which will directly hurt you... I don't need to tell you, Who is Veena for Sagar...because you already know... But what you should know is You matters to me...just give me once your trust.. I will restore our bond... I don't want to lose you and our bond🙏...Veena tula mahiti ahe mi kiti mand ahe...Tu mhanu shakte sagar bindok ahe...Bolne ki battee...",
              "Dear Chandraaa❤️, I can't put into words how deeply sorry🙏 I am for my mistake, but your kindness and forgiveness mean more to me than you’ll ever know💜. Thank you for holding onto me even when I faltered. I never want to lose you and the beautiful bond we share—your presence in my life is a blessing I cherish every single day. I promise to make things right, to nurture our connection, and to love you in a way that makes your heart feel safe and adored. You are my heart, my happiness, and I will never take you for granted again..\nlove you, now and always❤️...\nYour Lovely\n Bindok Magar😁",
            style:TextStyle(
              fontSize:19,
              fontWeight: FontWeight.bold
            )),
          ),

        ],
      )
      )
    );
  }
}




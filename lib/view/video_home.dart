import 'dart:developer';

import 'package:course_app/model/yt_video.dart';
import 'package:course_app/services/yt_api_services.dart';
import 'package:course_app/view/lecture_player.dart';
import 'package:course_app/view/video_screen.dart';
import 'package:course_app/view/yt_video_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YoutubeHomePage extends StatefulWidget {

   List<YtVideo> videos =[];

  YoutubeHomePage({super.key,required this.videos});

  @override
  State<YoutubeHomePage> createState() => _YoutubeHomePageState();
}

class _YoutubeHomePageState extends State<YoutubeHomePage> {
  // @override
  // void initState(){
  //   setList();
  //   super.initState();
  // }

  // void setList()async{
  //   log("In set list");
  //   videos =await YtApiServices().getAllVideosFromPlaylist();

  // }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Lecture"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()async{            

            //  videos =await YtApiServices().getAllVideosFromPlaylist();
            //  log("Videos : ${videos[0].channelName}");
            } )
        ],
      ),
      body:
      Consumer(
        builder:(context,YtVideoViewModel,_){
          return ListView.builder(
        itemCount:widget.videos.length,
        itemBuilder: 
      (context,index){
        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return LecturePlayer(videoId: "${widget.videos[index].videoId}");
              }));

          },
          child: SizedBox(
            height:200,
            child: Row(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
            Image.network("${widget.videos[index].thumbnailUrl}",scale: 5,),
             const SizedBox(width:20),
            Expanded(
              child: Column(
                children: [
                  Text("${widget.videos[index].videoTitle}"),
                  Text("${widget.videos[index].channelName}"),
                  
                ],
              ),
            )
              ],
            ),
          ),
        ),
      );
      });
        } ,)
      
      // Text("${widget.videos[0].channelName}"),
  //       Consumer<YtVideoViewModel>(
  //       builder: (context, ytVideoViewModel,_){
  //         if(ytVideoViewModel.playListItems.isEmpty){
  //           return Center(child: Text("No video"));
  //         }else{
  //   return  ListView.builder(
  //       itemCount:ytVideoViewModel.playListItems.length,
  //       itemBuilder: (context,index){
  //       return YoutubeVideoCard(ytVideo:videos[0]);
  //     });
  //         }
  // })


        // Consumer<YtVideoViewModel>(
        // builder: (context, ytVideoViewModel,_){
        //   if(ytVideoViewModel.playListItems.isEmpty){
        //     return Center(
        //       child:Text("There are no videos")
        //     );
        //   // /
        //   }else{
        //     return 
        //     ListView.builder(
        //       itemCount: ytVideoViewModel.playListItems.length,
        //       itemBuilder: (context,index){
        //         log("In lecture screen");
        //         return YoutubeVideoCard(ytVideo: videos[0],);
        //     }
        //     );
          // }
        // },
      // ),
    );
  }
}
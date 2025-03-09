import 'dart:convert';
import 'dart:developer';

import 'package:course_app/model/yt_video.dart';
import 'package:http/http.dart' as http;
import 'package:course_app/const/app_const.dart';


class YtApiServices{
  String baseUrl = "https://www.googleapis.com/youtube/v3/playlistItems";

  getAllVideosFromPlaylist()async{

    // try{

      List<YtVideo>? allVideos=[];

      
    var response = await http.get(Uri.parse(baseUrl+"?part=snippet&playlistId=PLjVLYmrlmjGfGLShoW0vVX_tcyT8u1Y3E&key=${ApiKey.api_key}"));
    if(response.statusCode==200){
      var jsonData = jsonDecode(response.body);
      // log("the data from yt api is $jsonData");

      List playListItems = jsonData['items'];
      log("${playListItems[0]}");

      for(var videoData in playListItems){
        YtVideo video =  YtVideo(
          videoId: videoData['snippet']['resourceId']['videoId'],
           videoTitle: videoData['snippet']['title'],
            thumbnailUrl: videoData['snippet']['thumbnails']['maxres']['url'], 
            viewsCount: "100K", 
            channelName: videoData['snippet']['channelTitle']);
        // log(video.videoId!);
        // log(video.videoTitle!);
        // log(video.thumbnailUrl!);
        // log(video.viewsCount!);
        // log(video.channelName!);


        allVideos.add(video);
        log("All Videos : $allVideos");
      }
      log("length = ${allVideos.length}");


    }else{
      // log(response.body);
      log("Unable to get data");
    }
    return allVideos;
    // }finally{};
    // }catch(ex){};
  }
}
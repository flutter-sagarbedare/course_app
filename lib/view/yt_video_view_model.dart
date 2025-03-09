import 'dart:developer';

import 'package:course_app/model/yt_video.dart';
import 'package:course_app/services/yt_api_services.dart';
import 'package:flutter/material.dart';

class YtVideoViewModel extends ChangeNotifier{
  List<YtVideo> _playListItems = [];
  
  List<YtVideo> get  playListItems =>_playListItems;

  getAllVideos()async {
    _playListItems = await YtApiServices().getAllVideosFromPlaylist();
    notifyListeners();
    // print("sagar :$playListItems");

  }

  //   Future<void> getAllVideos() async {
  //   try {
  //     _playListItems = await YtApiServices().getAllVideosFromPlaylist() ?? [];
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint("Error fetching videos: $e");
  //     _playListItems = [];
  //     notifyListeners();
  //   }
  // }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/models/user.dart';
import 'package:youtube_ui_clone/models/video.dart';
import 'package:youtube_ui_clone/widgets/suggestions.dart';
import 'package:youtube_ui_clone/widgets/user_profile.dart';
import 'package:youtube_ui_clone/widgets/video_widget.dart';

class SubscriptionsTab extends StatelessWidget {
  final User currentUser = new User(
      username: "Vitaliy Golub", profilePicture: AssetImage("assets/8.jpg"));

  List<Widget> getVideos() {
    List<Video> videos = generateVideos();
    List<Widget> videosWidgetList = [];

    videosWidgetList.add(Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Color(0xFF212121),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              UserProfile(currentUser: currentUser),
            ]),
          ),
          Divider(color: Color(0xFF909090)),
          Suggestions()
        ],
      ),
    ));

    for (Video video in videos) {
      videosWidgetList.add(VideoWidget(video: video));
    }

    return videosWidgetList;
  }

  List<String> videosList = [
    // "Вступ. Налаштування середовища. Flutter. Лекція 1",
    // "The Complete Cosmos Secrets of the Solar System HD",
    // "Best laptop for programming in 2020",
    "Eminem: Space Bound",
    "Get started with competitive programming",
    "How to ace the coding interview!",
    // "Queen: Bohemian Rhapsody",
    // "Avengers Endgame: Trailer"
  ];

  List<User> usersList = [
    // User(
    //     username: "Сергій Титенко",
    //     profilePicture: AssetImage("assets/0.1.jpg")),
    // User(
    //     username: "National Geographic",
    //     profilePicture: AssetImage("assets/1.1.jpg")),
    // User(username: "10BestOnes", profilePicture: AssetImage("assets/2.1.jpg")),
    User(username: "Eminem vevo", profilePicture: AssetImage("assets/3.jpg")),
    User(username: "Max", profilePicture: AssetImage("assets/4.jpg")),
    User(username: "Miller", profilePicture: AssetImage("assets/5.jpg")),
    // User(username: "Queen vevo", profilePicture: AssetImage("assets/6.jpg")),
    // User(username: "Marvel", profilePicture: AssetImage("assets/7.jpg"))
  ];

  List<Video> generateVideos() {
    Random random = new Random();
    List<Video> vids = [];
    for (int i = 0; i < videosList.length; i++) {
      vids.add(Video(
        AssetImage("assets/" + (i + 3).toString() + ".jpg"),
        random.nextInt(10000000) + 1000,
        DateTime.now().subtract(Duration(days: random.nextInt(1000) + 10)),
        videosList[i],
        usersList[i],
      ));
    }
    return vids;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF212121),
      child: ListView(children: getVideos()),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/models/user.dart';
import 'package:youtube_ui_clone/models/video.dart';
import 'package:youtube_ui_clone/widgets/suggestions.dart';
import 'package:youtube_ui_clone/widgets/video_widget.dart';

class ExploreTab extends StatelessWidget {
  List<Widget> getVideos(BuildContext context) {
    List<Video> videos = generateVideos();
    List<Widget> videosWidgetList = [];

    videosWidgetList.add(Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Suggestions(),
    ));

    for (Video video in videos) {
      videosWidgetList.add(VideoWidget(video: video));
    }

    return videosWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("Movies",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF909090),
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("Trending",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF909090)),
                          borderRadius: BorderRadius.circular(10.0)),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("Music",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF909090),
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("News",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF909090)),
                          borderRadius: BorderRadius.circular(10.0)),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("Learning",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF909090),
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("Gaming",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF909090)),
                          borderRadius: BorderRadius.circular(10.0)),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("Fashion & Beauty",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF909090),
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 22,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text("Live",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF909090)),
                          borderRadius: BorderRadius.circular(10.0)),
                    )
                  ],
                )),
            SizedBox(height: 10.0),
            getVideos(context)[1],
            getVideos(context)[2],
            // getVideos()[6],
            // getVideos()[5],
            // getVideos()[4],
            // getVideos()[3],
            // getVideos()[2],
            // getVideos()[1],
          ],
        ),
      ),
    );
  }

  List<String> videosList = [
    // "Вступ. Налаштування середовища. Flutter. Лекція 1",
    // "The Complete Cosmos Secrets of the Solar System HD",
    // "Best laptop for programming in 2020",
    // "Eminem: Space Bound",
    // "Get started with competitive programming",
    // "How to ace the coding interview!",
    "Queen: Bohemian Rhapsody",
    "Avengers Endgame: Trailer"
  ];

  List<User> usersList = [
    // User(
    //     username: "Сергій Титенко",
    //     profilePicture: AssetImage("assets/0.1.jpg")),
    // User(
    //     username: "National Geographic",
    //     profilePicture: AssetImage("assets/1.1.jpg")),
    //   User(username: "10BestOnes", profilePicture: AssetImage("assets/2.1.jpg")),
    //   User(
    //       username: "Eminem Music", profilePicture: AssetImage("assets/3.1.jpg")),
    //   User(username: "Max", profilePicture: AssetImage("assets/4.jpg")),
    // User(username: "Miller", profilePicture: AssetImage("assets/5.jpg")),
    User(username: "Queen vevo", profilePicture: AssetImage("assets/6.jpg")),
    User(username: "Marvel", profilePicture: AssetImage("assets/7.jpg"))
  ];

  List<Video> generateVideos() {
    Random random = new Random();
    List<Video> vids = [];
    for (int i = 0; i < videosList.length; i++) {
      vids.add(Video(
        AssetImage("assets/" + (i + 6).toString() + ".jpg"),
        // random.nextInt(10000000) + 1000,
        10,
        DateTime.now().subtract(Duration(days: random.nextInt(1000) + 10)),
        videosList[i],
        usersList[i],
      ));
    }
    return vids;
  }
}

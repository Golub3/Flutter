import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/models/video.dart';
import 'package:youtube_ui_clone/widgets/video_widget.dart';
import 'package:youtube_ui_clone/models/videoLibrary.dart';
import 'package:provider/provider.dart';

class Watched extends StatefulWidget {
  @override
  _Watched createState() => _Watched();
}

class _Watched extends State<Watched> {
  List<Widget> getVideos(watchedVideos) {
    List<Video> videos = watchedVideos;
    List<Widget> videosWidgetList = [];

    for (Video video in videos) {
      videosWidgetList.insert(0, VideoWidget(video: video));
    }

    return videosWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<VideoLibrary>(context);
    return new Scaffold(
      body: Container(
        color: Color(0xFF212121),
        child: ListView(children: getVideos(model.watchedVideos)),
      ),
    );
  }
}

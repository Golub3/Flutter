import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/models/video.dart';
import 'package:youtube_ui_clone/models/videoDetail.dart';
import 'package:youtube_ui_clone/models/videoLibrary.dart';
import 'package:provider/provider.dart';

class VideoWidget extends StatefulWidget {
  final Video video;

  VideoWidget({this.video});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoLibrary>(builder: (context, model, child) {
      super.build(context);
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            model.isWatched(widget.video) == true
                ? Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.red,
                      ),
                      image: DecorationImage(
                        image: widget.video.thumbnail,
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        // model.watcheTheVideo(widget.video);
                        setState(() {
                          widget.video.viewCount++;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              VideoDetail(widget.video, model),
                        ));
                      },
                    ))
                : Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.video.thumbnail,
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        model.watcheTheVideo(widget.video);
                        setState(() {
                          widget.video.viewCount++;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              VideoDetail(widget.video, model),
                        ));
                      },
                    )),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 35,
                      child: CircleAvatar(
                        backgroundImage: widget.video.user.profilePicture,
                      ),
                    ),
                    Container()
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.video.getVideoTitle(),
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Helvetica",
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.normal)),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(widget.video.user.username,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Helvetica",
                                    color: Color(0xFF909090))),
                            Text(" ∙ ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Helvetica",
                                    color: Color(0xFF909090))),
                            Text(widget.video.getViewCount() + " views",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Helvetica",
                                    color: Color(0xFF909090))),
                            Text(" ∙ ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Helvetica",
                                    color: Color(0xFF909090))),
                            Text(
                              widget.video.getTimeSinceUpload() + " ago",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Helvetica",
                                  color: Color(0xFF909090)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}

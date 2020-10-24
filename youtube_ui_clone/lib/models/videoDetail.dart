import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ui_clone/models/video.dart';
import 'package:youtube_ui_clone/models/videoLibrary.dart';
// import 'package:youtube_ui_clone/tabs/home_tab.dart';

class VideoDetail extends StatefulWidget {
  final Video videoD;
  bool like;
  bool dislike;

  VideoDetail(this.videoD, model) {
    if (model.isLiked(videoD) == true) {
      this.like = true;
      this.dislike = false;
    } else if (model.isDisliked(videoD) == true) {
      this.like = false;
      this.dislike = true;
    } else {
      this.like = false;
      this.dislike = false;
    }
  }

  @override
  _VideoDetailState createState() => _VideoDetailState(videoD);
}

class _VideoDetailState extends State<VideoDetail> {
  Video videoD;

  _VideoDetailState(videoD) {
    this.videoD = videoD;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _layouts = [
      _videoInfo(),
      _channelInfo(),
      _moreInfo(),
      // VideoList
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _layouts.clear();
    }

    return Scaffold(
        body: Column(
      children: <Widget>[
        _buildVideoPlayer(context),
        Expanded(
          child: ListView(
            children: _layouts,
          ),
        )
      ],
    ));
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      // width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 222.0
          : MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        image: DecorationImage(image: widget.videoD.thumbnail),
      ),
    );
  }

  Widget _videoInfo() {
    var model = Provider.of<VideoLibrary>(context);
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.videoD.videoTitle),
          subtitle: Text(widget.videoD.getViewCount() + " views"),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildButtonColumnLike(
                  Icons.thumb_up, "${widget.videoD.likeCount}", model),
              _buildButtonColumnDislike(
                  Icons.thumb_down, "${widget.videoD.dislikeCount}", model),
              _buildButtonColumn(Icons.share, "Share"),
              _buildButtonColumn(Icons.cloud_download, "Download"),
              _buildButtonColumn(Icons.playlist_add, "Save"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: IconButton(
            icon: Icon(icon, color: Colors.grey),
            onPressed: () {},
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildButtonColumnLike(
      IconData icon, String text, VideoLibrary model) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: IconButton(
            icon: Icon(
              icon,
              color: (widget.like == false) ? Colors.grey : Colors.red,
            ),
            onPressed: () {
              setState(() {
                widget.like = !widget.like;
                if (widget.like == true) {
                  model.likeTheVideo(videoD);
                  videoD.likeCount++;
                } else {
                  model.unlikeTheVideo(videoD);
                  videoD.likeCount--;
                }
                if (widget.dislike == true) {
                  widget.dislike = false;
                  videoD.dislikeCount--;
                }
              });
            },
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildButtonColumnDislike(
      IconData icon, String text, VideoLibrary model) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: IconButton(
            icon: Icon(
              icon,
              color: (widget.dislike == false) ? Colors.grey : Colors.red,
            ),
            onPressed: () {
              setState(() {
                widget.dislike = !widget.dislike;
                if (widget.dislike == true) {
                  model.dislikeTheVideo(videoD);
                  videoD.dislikeCount++;
                } else {
                  model.unlikeTheVideo(videoD);
                  videoD.dislikeCount--;
                }
                if (widget.like == true) {
                  widget.like = false;
                  videoD.likeCount--;
                }
              });
            },
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _channelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: widget.videoD.user.profilePicture,
              ),
              title: Text(
                "${widget.videoD.user.username}",
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("15,000 subscribers"),
            ),
          ),
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_filled,
                color: Colors.red,
              ),
              label: Text(
                "SUBSCRIBE",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Text("Up next")),
          Text("Autoplay"),
          Switch(
            onChanged: (c) {},
            value: true,
          ),
        ],
      ),
    );
  }
}

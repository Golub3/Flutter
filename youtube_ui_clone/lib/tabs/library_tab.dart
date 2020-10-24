import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/pages/watched.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ui_clone/models/videoLibrary.dart';

class LibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<VideoLibrary>(context);
    return Container(
      color: Color(0xFF212121),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.history, color: Color(0xFF909090)),
              title: Text(
                'History',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Watched()));
              }),
          ListTile(
            leading: Icon(Icons.file_download, color: Color(0xFF909090)),
            title: Text('Downloads', style: TextStyle(color: Colors.white)),
            subtitle: Text('2 recommendations',
                style: TextStyle(color: Color(0xFF909090), fontSize: 12.0)),
          ),
          ListTile(
            leading: Icon(Icons.video_library, color: Color(0xFF909090)),
            title: Text('Your videos', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.attach_money, color: Color(0xFF909090)),
            title: Text('Purchases', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.watch_later, color: Color(0xFF909090)),
            title: Text('Watch later', style: TextStyle(color: Colors.white)),
            subtitle: Text('Videos you save for later',
                style: TextStyle(color: Color(0xFF909090), fontSize: 12.0)),
          ),
          Divider(color: Colors.white),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Playlists',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Row(
                  children: <Widget>[
                    Text('Recently added',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    Icon(Icons.arrow_drop_down, color: Colors.white)
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.add, color: Colors.lightBlue),
            title:
                Text('New Playlist', style: TextStyle(color: Colors.lightBlue)),
          ),
          ListTile(
            leading: Icon(Icons.thumb_up, color: Color(0xFF909090)),
            title: Text('Liked videos', style: TextStyle(color: Colors.white)),
            subtitle: Text('${model.likedVideos.length}',
                style: TextStyle(color: Color(0xFF909090), fontSize: 12.0)),
          ),
        ],
      ),
    );
  }
}

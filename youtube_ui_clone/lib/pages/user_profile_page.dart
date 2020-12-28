import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_ui_clone/features/api/services.dart';
import 'package:youtube_ui_clone/features/bloc/albums/bloc.dart';
import 'package:youtube_ui_clone/features/routing/InitialDiagramScreen.dart';
import 'package:youtube_ui_clone/features/screens/settings_screen.dart';
import 'package:youtube_ui_clone/features/screens/your_data.dart';
import 'package:youtube_ui_clone/features/screens/your_data.dart';
import 'package:youtube_ui_clone/models/user.dart';

class UserProfilePage extends StatelessWidget {
  final User currentUser;
  final _diagramScreen = GlobalKey<NavigatorState>();

  UserProfilePage({this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close,
                color: Theme.of(context).textTheme.bodyText1.color)),
        title: Text('Account',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundImage: currentUser.profilePicture, radius: 30),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(currentUser.username,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontSize: 16.0)),
                      SizedBox(height: 5.0),
                      Text('10022000golub@gmail.com',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontSize: 16.0)),
                      SizedBox(height: 5.0),
                      Text('Manage your Google Account',
                          style: TextStyle(color: Colors.lightBlue))
                    ],
                  )
                ],
              ),
            ),
            Divider(color: Theme.of(context).textTheme.bodyText1.color),
            ListTile(
              leading: Icon(Icons.account_box, color: Color(0xFF909090)),
              title: Text('Your channel',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
            ),
            ListTile(
              leading:
                  Icon(Icons.settings_applications, color: Color(0xFF909090)),
              title: Text('Youtube Studio',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Color(0xFF909090)),
              title: Text('Time watched',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
            ),
            ListTile(
              leading: Icon(Icons.video_library, color: Color(0xFF909090)),
              title: Text('Get YouTube Premium',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Color(0xFF909090)),
              title: Text('Paid memberships',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
            ),
            ListTile(
              leading: Icon(Icons.supervisor_account, color: Color(0xFF909090)),
              title: Text('Switch account',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
            ),
            ListTile(
                leading: Icon(Icons.security, color: Color(0xFF909090)),
                title: Text('Your data in YouTube',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => YourData()));
                }),
            Divider(color: Theme.of(context).textTheme.bodyText1.color),
            ListTile(
                leading: Icon(Icons.settings, color: Color(0xFF909090)),
                title: Text('Settings',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color)),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) =>
                              AlbumsBloc(albumsRepo: AlbumServices()),
                          child: AlbumsScreen())));
                }),
            ListTile(
              leading: Icon(Icons.help, color: Color(0xFF909090)),
              title: Text('Help & feedback',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color)),
            ),
          ],
        ),
      ),
    );
  }
}

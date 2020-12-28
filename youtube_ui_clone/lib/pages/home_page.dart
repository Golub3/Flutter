import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_ui_clone/features/bloc/theme/theme_bloc.dart';
import 'package:youtube_ui_clone/features/bloc/theme/theme_events.dart';
import 'package:youtube_ui_clone/features/settings/preferences.dart';
import 'package:youtube_ui_clone/models/user.dart';
import 'package:youtube_ui_clone/pages/user_profile_page.dart';
import 'package:youtube_ui_clone/tabs/home_tab.dart';
import 'package:youtube_ui_clone/tabs/notifications_tab.dart';
import 'package:youtube_ui_clone/tabs/explore_tab.dart';
import 'package:youtube_ui_clone/tabs/library_tab.dart';
import 'package:youtube_ui_clone/tabs/subscriptions_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User currentUser = new User(
      username: "Vitaliy Golub", profilePicture: AssetImage("assets/9.jpg"));

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    // ignore: deprecated_member_use
    context.bloc<ThemeBloc>().add(ThemeEvent(appTheme: Preferences.getTheme()));
  }

  List<Widget> tabsList = [
    Tab(
      icon: Icon(Icons.home),
      text: "Home",
    ),
    Tab(
      icon: Icon(Icons.explore),
      text: "Explore",
    ),
    Tab(
      icon: Icon(Icons.subscriptions),
      text: "Subscriptions",
    ),
    Tab(
      icon: Icon(Icons.notifications),
      text: "Notifications",
    ),
    Tab(
      icon: Icon(Icons.video_library),
      text: "Library",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        width: 35.0, child: Image.asset("assets/logo.png")),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("YouTube",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.videocam),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  UserProfilePage(currentUser: currentUser)));
                        },
                        child: CircleAvatar(
                          backgroundImage: currentUser.profilePicture,
                          radius: 20,
                        )),
                  ],
                )
              ],
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          body: TabBarView(
            children: [
              HomeTab(),
              ExploreTab(),
              SubscriptionsTab(),
              NotificationsTab(),
              LibraryTab()
            ],
          ),
          bottomNavigationBar: TabBar(
            labelStyle: TextStyle(fontSize: 7, fontFamily: "Helvetica"),
            tabs: tabsList,
            labelColor: Theme.of(context).textTheme.bodyText1.color,
            unselectedLabelColor: Theme.of(context).textTheme.bodyText2.color,
            indicatorColor: Colors.transparent,
          ),
          backgroundColor: Theme.of(context).backgroundColor),
    );
  }
}

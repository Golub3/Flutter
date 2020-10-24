import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'package:youtube_ui_clone/models/videoLibrary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<VideoLibrary>(
              create: (context) => VideoLibrary()),
        ],
        child: MaterialApp(
            title: 'Youtube Clone',
            debugShowCheckedModeBanner: false,
            home: HomePage()));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_ui_clone/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'package:youtube_ui_clone/models/videoLibrary.dart';

import 'features/bloc/theme/theme_bloc.dart';
import 'features/bloc/theme/theme_state.dart';
import 'features/settings/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
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
        child: BlocProvider(
          create: (context) => ThemeBloc(),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (BuildContext context, ThemeState themeState) {
              return MaterialApp(
                  title: 'Youtube Clone',
                  debugShowCheckedModeBanner: false,
                  theme: themeState.themeData,
                  home: HomePage());
            },
          ),
        ));
  }
}

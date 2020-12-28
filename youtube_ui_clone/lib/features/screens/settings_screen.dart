import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_ui_clone/features/bloc/albums/bloc.dart';
import 'package:youtube_ui_clone/features/bloc/albums/events.dart';
import 'package:youtube_ui_clone/features/bloc/albums/states.dart';
import 'package:youtube_ui_clone/features/bloc/theme/theme_bloc.dart';
import 'package:youtube_ui_clone/features/bloc/theme/theme_events.dart';
import 'package:youtube_ui_clone/features/model/albums_list.dart';
import 'package:youtube_ui_clone/features/settings/app_themes.dart';
import 'package:youtube_ui_clone/features/settings/preferences.dart';
import 'package:youtube_ui_clone/features/widgets/error.dart';
import 'package:youtube_ui_clone/features/widgets/list_row.dart';
import 'package:youtube_ui_clone/features/widgets/loading.dart';
import 'package:youtube_ui_clone/features/widgets/txt.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  //

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadAlbums();
  }

  _loadTheme() async {
    // ignore: deprecated_member_use
    context.bloc<ThemeBloc>().add(ThemeEvent(appTheme: Preferences.getTheme()));
  }

  _loadAlbums() async {
    // ignore: deprecated_member_use
    context.bloc<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  _setTheme(bool darkTheme) async {
    AppTheme selectedTheme =
        darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    // ignore: deprecated_member_use
    context.bloc<ThemeBloc>().add(ThemeEvent(appTheme: selectedTheme));
    Preferences.saveTheme(selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).textTheme.bodyText1.color),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Txt(text: 'Albums'),
        actions: [
          Switch(
            inactiveTrackColor: Colors.blue,
            activeColor: Colors.black,
            activeTrackColor: Colors.blue,
            value: Preferences.getTheme() == AppTheme.lightTheme,
            onChanged: (val) async {
              _setTheme(val);
            },
          )
        ],
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (BuildContext context, AlbumsState state) {
          if (state is AlbumsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadAlbums,
            );
          }
          if (state is AlbumsLoaded) {
            List<Album> albums = state.albums;
            return _list(albums);
          }
          return Loading();
        }),
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListRow(album: album);
        },
      ),
    );
  }
}

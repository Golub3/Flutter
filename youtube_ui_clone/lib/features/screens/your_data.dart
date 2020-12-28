import 'package:flutter/material.dart';
import 'package:youtube_ui_clone/features/routing/AppRoutes.dart';
import 'package:youtube_ui_clone/features/routing/UndefinedView.dart';

class YourData extends StatefulWidget {
  @override
  _YourDataState createState() => _YourDataState();
}

class _YourDataState extends State<YourData> {
  int _currentIndex = 0;

  final _diagramScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _diagramScreen,
            initialRoute: '/',
            onGenerateRoute: generateRouteForDiagramsScreen,
            onUnknownRoute: (settings) => MaterialPageRoute(
                builder: (context) => UndefinedView(
                      name: settings.name,
                    )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (val) => _onTap(val, context),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            title: Text('My diagrams'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Other data'),
          ),
        ],
      ),
    );
  }

  void _onTap(int val, BuildContext context) {
    setState(() {
      _currentIndex = val;
    });
  }
}

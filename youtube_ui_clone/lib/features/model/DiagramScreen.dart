import 'package:youtube_ui_clone/features/screens/BarChartPage.dart';
import 'package:flutter/material.dart';

class DiagramScreen extends StatelessWidget {
  final String title;
  final String message;
  final PaintingStyle paintingStyle;

  const DiagramScreen({
    Key key,
    @required this.title,
    @required this.message,
    @required this.paintingStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: BarChartPage(paintingStyle: paintingStyle),
      ),
    );
  }
}

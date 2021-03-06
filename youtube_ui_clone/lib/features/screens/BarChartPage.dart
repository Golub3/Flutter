import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../diagram/MyBar.dart';

class BarChartPage extends StatefulWidget {
  final PaintingStyle paintingStyle;
  BarChartPage({this.paintingStyle = PaintingStyle.fill});

  @override
  BarChartPageState createState() => BarChartPageState();
}

class BarChartPageState extends State<BarChartPage>
    with TickerProviderStateMixin {
  static const size = const Size(300.0, 400.0);
  final random = Random();
  AnimationController animation;
  BarChartTween tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    tween = BarChartTween(
      BarChart.empty(size),
      BarChart.random(size, random),
    );
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = BarChartTween(
        tween.evaluate(animation),
        BarChart.random(size, random),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: size,
          painter:
              BarChartPainter(tween.animate(animation), widget.paintingStyle),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}

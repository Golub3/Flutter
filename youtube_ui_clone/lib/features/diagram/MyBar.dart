import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'ColorPalette.dart';
import 'MyTween.dart';

class BarChart {
  final List<MyBar> bars;

  BarChart(this.bars);

  factory BarChart.empty(Size size) {
    return BarChart(<MyBar>[]);
  }

  factory BarChart.random(Size size, Random random) {
    var barWidthFraction = 0.8;
    var ranks = selectRanks(random, ColorPalette.primary.length);
    var barCount = ranks.length;
    var barDistance = size.width / (1 + barCount);
    var barWidth = barDistance * barWidthFraction;
    var startX = barDistance - barWidth / 2;

    final bars = List.generate(
        barCount,
        (i) => MyBar(
              ranks[i],
              startX + i * barDistance,
              barWidth,
              random.nextDouble() * size.height,
              ColorPalette.primary[ranks[i]],
            ));
    return BarChart(bars);
  }

  static List<int> selectRanks(Random random, int cap) {
    var ranks = <int>[];
    var rank = 0;
    while (true) {
      if (random.nextDouble() < 0.3) rank++;
      if (cap <= rank) break;
      ranks.add(rank);
      rank++;
    }
    return ranks;
  }
}

class BarChartTween extends Tween<BarChart> {
  final MyTween _barsTween;

  BarChartTween(BarChart begin, BarChart end)
      : _barsTween = MyTween(begin.bars, end.bars),
        super(begin: begin, end: end);

  @override
  BarChart lerp(double t) => BarChart(_barsTween.lerp(t));
}

class MyBar {
  MyBar(this.rank, this.x, this.width, this.height, this.color);

  final int rank;
  final double x;
  final double width;
  final double height;
  final Color color;

  MyBar get empty => MyBar(rank, x, 0.0, 0.0, color);

  bool operator <(MyBar other) => rank < other.rank;

  Tween<MyBar> tweenTo(MyBar other) => BarTween(this, other);

  static MyBar lerp(MyBar begin, MyBar end, double t) {
    return MyBar(
      begin.rank,
      lerpDouble(begin.x, end.x, t), //a + (b - a) * t
      lerpDouble(begin.width, end.width, t),
      lerpDouble(begin.height, end.height, t),
      Color.lerp(begin.color, end.color, t),
    );
  }
}

class BarTween extends Tween<MyBar> {
  BarTween(MyBar begin, MyBar end) : super(begin: begin, end: end);

  @override
  MyBar lerp(double t) => MyBar.lerp(begin, end, t);
}

class BarChartPainter extends CustomPainter {
  final Animation<BarChart> animation;
  final PaintingStyle paintingStyle;

  BarChartPainter(Animation<BarChart> animation, PaintingStyle paintingStyle)
      : animation = animation,
        paintingStyle = paintingStyle,
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = paintingStyle;
    final chart = animation.value;
    for (final bar in chart.bars) {
      paint.color = bar.color;
      canvas.drawRect(
        Rect.fromLTWH(
          bar.x,
          size.height - bar.height,
          bar.width,
          bar.height,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(BarChartPainter old) => false;
}

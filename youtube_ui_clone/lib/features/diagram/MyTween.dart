import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'MyBar.dart';

class MyTween extends Tween<List<MyBar>> {
  final _tweens = <Tween<MyBar>>[];

  MyTween(List<MyBar> begin, List<MyBar> end) : super(begin: begin, end: end) {
    final aMax = begin.length;
    final bMax = end.length;
    var a = 0;
    var b = 0;
    while (a + b < aMax + bMax) {
      if (a < aMax) {
        _tweens.add(begin[a].tweenTo(begin[a].empty));
        a++;
      } else if (b < bMax) {
        _tweens.add(end[b].empty.tweenTo(end[b]));
        b++;
      } else {
        _tweens.add(begin[a].tweenTo(end[b]));
        a++;
        b++;
      }
    }
  }

  @override
  List<MyBar> lerp(double t) => List.generate(
        _tweens.length,
        (i) => _tweens[i].lerp(t),
      );
}

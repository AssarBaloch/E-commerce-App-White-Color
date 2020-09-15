import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimtion extends StatelessWidget {
  final double delay;
  final Widget child;
  FadeAnimtion({this.child, this.delay});
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("size").add(Duration(seconds: 4), Tween(begin: 0.0, end: 150.0)),

      Track('opacity')
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track('translatey').add(
        Duration(milliseconds: 500),
        Tween(begin: 120.0, end: 0.0),
       curve: Curves.easeInOut,
       ),
      
    ]);
    return ControlledAnimation(
      delay: Duration(milliseconds: (500*delay).round(),
    ),
    duration: tween.duration,
    tween: tween,
    child: child,
    builderWithChild: (context,child,animation)=>Opacity(
      opacity: animation['opacity'],
      child: Transform.translate(offset: Offset(0,animation['translatey']),child: child,),

    ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:restaurant_app/side_navbar.dart';

class NavBarAnimator extends StatefulWidget {
  NavBarAnimator({this.idx, this.previousPosition});

  final int idx;
  final double previousPosition;

  @override
  _NavBarAnimatorState createState() => _NavBarAnimatorState();
}

class _NavBarAnimatorState extends State<NavBarAnimator> with SingleTickerProviderStateMixin{

  double _bubbleFraction = 0.0;

  Animation<double> bubbleFraction;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this
    );
    

  }

  Future _playAnimation() async {
    
    bubbleFraction = Tween(begin: 300.0, end: 125.0).animate(controller)
      ..addListener(() {
        setState(() {
          _bubbleFraction = bubbleFraction.value;
        });
      });
    
    try {
      await controller.forward();
    } on TickerCanceled {

    }
  }

  @override
  Widget build(BuildContext context) {
    _playAnimation();
    return CustomPaint(
      painter: DiamondPainter(anim: _bubbleFraction),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    
  }
}
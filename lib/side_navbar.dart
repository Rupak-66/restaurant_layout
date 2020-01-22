import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:restaurant_app/navbar_animator.dart';

class SideNavBar extends StatefulWidget {
  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> with SingleTickerProviderStateMixin{
  int idx = 5;
  double position = 825.0;
  double newPosition;

  double _bubbleFraction = 0.0;
  Animation <double> bubbleFraction;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000), vsync: this
    );

    
    
    super.initState();




  }

  _playAnimation(double pos) {
    bubbleFraction = Tween(begin: position, end: pos).animate(controller)
      ..addListener(() {
        setState(() {
          position = _bubbleFraction;
          _bubbleFraction = bubbleFraction.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Color(0xff00000),
      width: MediaQuery.of(context).size.width / 5,
      child: Menu(context),
    ));
  }
  
  Widget Menu(context) {
    
    return Stack(
      children: <Widget>[
        
        CustomPaint(
          painter: DiamondPainter(anim: _bubbleFraction == 0 ? position : _bubbleFraction),
        ),
        //NavBarAnimator(idx: idx, previousPosition: position,),
        Container(
            color: Color(0xffddbc95),
            width: MediaQuery.of(context).size.width / 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      idx = 0;
                      _playAnimation(125.0);
                      controller.forward(from: 0.0);
                    });
                  },
                  child: RotatedBox(
                      quarterTurns: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Icon(
                          Icons.contact_mail,
                          color: Color(0xff000000),
                          size: 32,
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      idx = 1;
                      _playAnimation(190.0);
                      controller.forward(from: 0.0);
                    });
                  },
                  child: RotatedBox(
                      quarterTurns: 4,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
                        child: Icon(
                          Icons.star,
                          color: Color(0xff000000),
                          size: 32,
                        ),
                      )),
                ),
                item('Desserts'),
                item('Beverages'),
                item('Vegetarian'),
                item('Combos')
              ],
            ))
      ],
    );
  }

  Widget item(String text) {
    return GestureDetector(
        onTap: () {
          switch (text) {
            case 'Combos':
              setState(() {
                idx = 5;
                _playAnimation(825.0);
                controller.forward(from: 0.0);
              });
              break;
            case 'Vegetarian':
              setState(() {
                idx = 4;
                _playAnimation(685.0);
                controller.forward(from: 0.0);
              });
              break;
            case 'Beverages':
              setState(() {
                idx = 3;
                _playAnimation(530.0);
                controller.forward(from: 0.0);
              });
              break;
            case 'Desserts':
              setState(() {
                idx = 2;
                _playAnimation(375.0);
                controller.forward(from: 0.0);
              });
              break;
            default:
              break;
          }
        },
        child: RotatedBox(
            quarterTurns: 3,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Color(0xff000000),
                    fontFamily: 'LemonJuice',
                    fontSize: 32),
              ),
            )));
  }
}

class DiamondPainter extends CustomPainter {
  DiamondPainter({this.anim});

  final double anim;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xffddbc95);

    canvas.drawCircle(Offset(40, anim), 40.0, paint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) {
    // TODO: implement shouldRebuildSemantics
    return true;
  }
}

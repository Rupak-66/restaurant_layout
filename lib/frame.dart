import 'package:flutter/material.dart';
import 'package:restaurant_app/content.dart';
import 'side_navbar.dart';

class FramePage extends StatefulWidget {
  @override
  _FramePageState createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ContentPage(),
        SideNavBar(),
        
      ],
    );
  }
}
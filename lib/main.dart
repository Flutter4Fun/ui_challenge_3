import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_challenge_3/hero_widget.dart';

import 'hero_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 4 Fun',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double progress = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Flutter4Fun.com'),
      ),
      backgroundColor: Color(0xffFF6958),
      body: Center(
        child: HeroRowWidget(
          hero: heroes[0],
        ),
      ),
    );
  }
}

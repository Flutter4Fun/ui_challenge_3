import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_challenge_3/hero_widget.dart';

import 'pages/hero_list_page.dart';
import 'hero_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 4 Fun',
      home: HeroListPage(),
    );
  }
}

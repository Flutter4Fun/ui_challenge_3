import 'package:flutter/material.dart';

import 'pages/hero_list_page.dart';

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

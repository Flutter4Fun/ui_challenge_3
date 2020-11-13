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

  ScrollController _scrollController;

  double toolbarOpacity = 1.0;

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= 80) {
          toolbarOpacity = (80 - _scrollController.offset) / 80;
        } else {
          toolbarOpacity = 0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(top: 80, bottom: 40),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: HeroRowWidget(hero: heroes[index]),
                );
              },
              itemCount: heroes.length,
            ),
            Opacity(
              opacity: toolbarOpacity,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 18,),
                    Text(
                      'Flutter4Fun.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container(height: 80,)),
                    Container(
                      width: 80,
                      height: 80,
                      child: Icon(Icons.menu, color: Colors.white,),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xffFF6958),
            Color(0xffC358ED),
          ],
          begin: Alignment(0.3, -1),
          end: Alignment(-0.8, 1),
        )),
      ),
    );
  }
}

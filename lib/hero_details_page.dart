import 'package:flutter/material.dart';
import 'package:ui_challenge_3/hero_model.dart';

class HeroDetailsPage extends StatefulWidget {
  final HeroModel hero;

  const HeroDetailsPage(this.hero);

  @override
  _HeroDetailsPageState createState() => _HeroDetailsPageState();
}

class _HeroDetailsPageState extends State<HeroDetailsPage> {
  final appBarHeight = 80.0;

  ScrollController _scrollController;

  double toolbarOpacity = 1.0;

  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset <= appBarHeight) {
          toolbarOpacity = (appBarHeight - _scrollController.offset) / appBarHeight;
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
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: appBarHeight),
              children: [
                _HeroDetailsImage(widget.hero),
                _HeroDetailsName(widget.hero.name),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                  child: Text(
                    "Super smash bros ultimate villagers from the animal crossing series. This troops fight most effectively in large group",
                    style:
                        TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 28,
                    ),
                    Expanded(
                      child: Container(
                        height: 54,
                        child: OutlineButton(
                          child: new Text(
                            'Add Favourite',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          onPressed: () {},
                          color: Colors.white,
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                          highlightedBorderColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Container(
                        height: 56,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFFF29758),
                                Color(0xFFEF5D67),
                              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                              // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
              ],
            ),
            SafeArea(
              child: Opacity(
                opacity: toolbarOpacity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 18,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      'Overview',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: appBarHeight,
                    )),
                    Container(
                      width: appBarHeight,
                      height: appBarHeight,
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF4E342),
              Color(0xFFEE3474),
            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
      ),
    );
  }
}

class _HeroDetailsImage extends StatelessWidget {
  final HeroModel hero;

  const _HeroDetailsImage(this.hero);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 28.0, right: 28.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          child: Stack(
            children: [
              Align(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Hero(
                        tag: hero.name,
                        child: Image.asset(hero.image, package: 'ui_challenge_3',),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroDetailsName extends StatelessWidget {
  final String heroName;

  const _HeroDetailsName(this.heroName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8),
      height: 86,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              heroName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                heroName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.1),
                  fontWeight: FontWeight.bold,
                  fontSize: 56,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

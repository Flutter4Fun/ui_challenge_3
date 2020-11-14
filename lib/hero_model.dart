import 'package:flutter/material.dart';

class HeroModel {
  final String name;
  final String image;
  final double speed, health, attack;

  HeroModel({
    @required this.name,
    @required this.image,
    @required this.speed,
    @required this.health,
    @required this.attack,
  });
}

final List<HeroModel> heroes = [
  HeroModel(
    name: 'Bar Bar Green',
    image: 'assets/images/player1.png',
    speed: 16.0,
    health: 40.0,
    attack: 65.0,
  ),
  HeroModel(
    name: 'Cow Master',
    image: 'assets/images/player2.png',
    speed: 25.0,
    health: 50.0,
    attack: 75.0,
  ),
  HeroModel(
    name: 'Bombardier',
    image: 'assets/images/player3.png',
    speed: 10.0,
    health: 80.0,
    attack: 80.0,
  ),
];

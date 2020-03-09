import 'package:flutter/material.dart';

class GameScene {
  String id;
  String name;
  List<TextSpan> description;
  TypeOfScene type;
  ThemeData themeData;
  GameScene nextScene;

  GameScene({
    this.id = '',
    this.name = '',
    this.description = const [],
    this.type = TypeOfScene.regular,
    this.themeData,
    this.nextScene,
  });
}

enum TypeOfScene {
  regular,
  cutscene,
  location
}
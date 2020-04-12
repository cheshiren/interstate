import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

import './models/game_scene.dart';
import './models/game_object.dart';
import './story/scenes.dart';

GameScene currentScene = locationInsideTA;
GameObject currentObject = GameObject();
ScrollController scrollController = ScrollController();
ItemScrollController itemScrollController = ItemScrollController();
ItemPositionsListener itemPositionListener = ItemPositionsListener.create();
int logLength;
var log = currentScene.description;
ThemeData currentThemeData = currentScene.themeData;
bool transition = false;
Map<String, List<dynamic>> events = {
  'globalEvents': [],
  'localEvents': [],
  'objectEvents': [],
};
List<dynamic> eventsToRemove = [];
int numberOfObjButtons = 0;
int numberOfActButtons = 0;

TextTheme customTextTheme = ThemeData.light().textTheme.copyWith(
      bodyText1: TextStyle(
        fontSize: 20,
        height: 1.4,
      ),
      bodyText2: TextStyle(
        height: 0.7,
      ),
      headline6: TextStyle(
        fontSize: 20,
        height: 1.4,
      ),
    );
ThemeData mainTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'FiraSans',
  primarySwatch: Colors.brown,
  accentColor: Color(0xFFD6AB5F),
  canvasColor: Color(0xFFfffcd0),
  textTheme: customTextTheme.copyWith(
    bodyText1: customTextTheme.bodyText1.copyWith(color: Color(0xFF5A3A23)),
    headline6: customTextTheme.headline6.copyWith(color: Color(0xFF143333)),
  ),
);

ThemeData newFriendTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'FiraSans',
  accentColor: Color(0xFF550000),
  canvasColor: Color(0xFF919DAA),
  textTheme: customTextTheme.copyWith(
    bodyText1: customTextTheme.bodyText1.copyWith(color: Color(0xFF550000)),
  ),
);

ThemeData mjLeafTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'FiraSans',
  accentColor: Color(0xFFa7c499),
  canvasColor: Color(0xFF000000),
  textTheme: customTextTheme.copyWith(
    bodyText1: customTextTheme.bodyText1.copyWith(color: Color(0xFFa7c499)),
  ),
);

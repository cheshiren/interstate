import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

import '../init.dart';
import '../custom_functions.dart';
import '../models/game_scene.dart';
import '../models/game_object.dart';
// import '../story/scenes.dart';
// import '../story/objects.dart';
import '../widgets/log_view.dart';
import '../widgets/button_column.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  void _addTextSpan(String label, String text, List random) {
    final _newLabelSpan = TextSpan(
      style: currentThemeData.textTheme.headline6,
      text: label,
    );
    final _newTextSpan = TextSpan(
      style: currentThemeData.textTheme.bodyText1,
      text: text,
    );

    setState(() {
      log.add(_newLabelSpan);
      log.add(_newTextSpan);
      log.addAll([...random]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    bool _isLargeScreen = _mediaQuery.size.width > 600;

    Widget floatingButtonType() {
      GameScene _toBeScene;
      ThemeData _toBeThemeData;
      if (currentScene.nextScene != null) {
        _toBeScene = currentScene.nextScene;
        _toBeThemeData = currentScene.nextScene.themeData;
      } else {
        _toBeScene = GameScene();
        _toBeThemeData = mainTheme;
      }

      currentThemeData = currentScene.themeData;

      if (!transition) {
        if (currentScene.type != TypeOfScene.cutscene) {
          return _isLargeScreen
              ? ButtonColumn(_addTextSpan, _isLargeScreen,)
              : FloatingActionButton(
                  child: Icon(
                    Icons.keyboard_arrow_up,
                  ),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: currentThemeData.scaffoldBackgroundColor,
                    builder: (ctx) => Theme(
                      data: currentThemeData,
                      child: ButtonColumn(_addTextSpan, _isLargeScreen,),
                    ),
                  ),
                );
        } else {
          return FloatingActionButton(
            child: Text(
              '···',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            onPressed: () {
              setState(() {
                if (currentScene.description.length == 1) {
                  transition = true;
                }
                logLength = log.length;
                log.add(toTheLast(currentScene.description));
                Future.delayed(Duration(milliseconds: 100), () {
                  itemScrollController.scrollTo(
                      index: logLength, duration: Duration(milliseconds: 500));
                });
              });
            },
          );
        }
      } else {
        transition = false;
        return Theme(
          data: _toBeThemeData,
          child: FloatingActionButton(
            child: Icon(
              Icons.keyboard_arrow_right,
            ),
            onPressed: () {
              currentScene = _toBeScene;
              currentThemeData = _toBeThemeData;
              // Если текущий объект не принадлежит новой сцене, то сбрасываем фокус
              if (!currentObject.scenes.contains(currentScene.id)) {
                currentObject = GameObject();
              }
              if (currentScene.type != TypeOfScene.cutscene) {
                log = currentScene.description;
                // } else if (currentScene.type == TypeOfScene.location) {
                //   log.add(toTheLast(currentScene.description));
              } else {
                log.clear();
                log.add(toTheLast(currentScene.description));
              }
              itemScrollController = ItemScrollController();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        );
      }
    }

    return Theme(
      data: currentThemeData,
      child: Scaffold(
        body: Center(
          child: Container(
            height: _mediaQuery.size.height,
            constraints: BoxConstraints(
              maxWidth: 800,
            ),
            padding: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 40),
            child: LogView(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButtonType(),
      ),
    );
  }
}

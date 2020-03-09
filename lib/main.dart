import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import './test.dart';

// import './init.dart';
import './screens/story_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]); // сокрытие системного интерфейса
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); // ориентация экрана — только портретная
    return MaterialApp(
      title: 'Интерстейт',
      initialRoute: '/',
      routes: {
        '/': (ctx) => StoryScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => StoryScreen(),
        );
      },
    );
  }
}

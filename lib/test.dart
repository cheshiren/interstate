import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = ScrollController();
  List<Widget> tiles = [];
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(
            () {
              n++;
              tiles.add(ListTile(title: Text('ListTile $n')));
            },
          );
          Future.delayed(Duration(milliseconds: 100), () {
            _controller.animateTo(
              _controller.position.maxScrollExtent,
              curve: Curves.linear,
              duration: Duration(milliseconds: 500),
            );
          });
        },
        child: ListView.builder(
            controller: _controller,
            itemCount: tiles.length,
            itemBuilder: (context, index) => tiles[index]),
      ),
    );
  }
}

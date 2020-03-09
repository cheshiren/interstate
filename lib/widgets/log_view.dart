import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

import '../init.dart';

class LogView extends StatefulWidget {
  Function scrollTFC;
  LogView(this.scrollTFC);
  
  @override
  _LogViewState createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
      // itemPositionsListener: itemPositionListener,
      itemCount: log.length,
      // initialScrollIndex: log.length-1,
      itemBuilder: (ctx, index) {
        return RichText(
            textAlign: log[index].style == currentThemeData.textTheme.headline6
                ? TextAlign.center
                : TextAlign.left,
            text: TextSpan(children: <TextSpan>[
              log[index],
              TextSpan(
                style: currentThemeData.textTheme.bodyText2,
                text: '\n',
              ),
            ]));
      },
    );
  }

  //   return ListView.builder(
  //     controller: scrollController,
  //     itemCount: log.length,
  //     itemBuilder: (ctx, index) {
  //       return RichText(
  //           textAlign: log[index].style == currentThemeData.textTheme.headline6
  //               ? TextAlign.center
  //               : TextAlign.left,
  //           text: TextSpan(children: <TextSpan>[
  //             log[index],
  //             TextSpan(
  //               style: currentThemeData.textTheme.bodyText2,
  //               text: '\n',
  //             ),
  //           ]));
  //     },
  //   );
  // }
}

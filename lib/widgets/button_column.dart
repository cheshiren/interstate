import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

import '../init.dart';
import '../custom_functions.dart';
// import '../models/game_object.dart';
import '../story/objects.dart';

class ButtonColumn extends StatefulWidget {
  final Function newTextSpanFunc;
  final bool isLargeScreen;

  ButtonColumn(this.newTextSpanFunc, this.isLargeScreen);

  @override
  _ButtonColumnState createState() => _ButtonColumnState();
}

class _ButtonColumnState extends State<ButtonColumn> {
  // GameObject currentObject = GameObject(id: '');
  List _randomResult;

  void _fillActionsColumn(obj) {
    setState(() {
      currentObject = obj;
    });
  }

  void _showActionsResult(
      {cmdBefore, logLabelResult, textResult, textFuncResult, cmdResult}) {
    logLabelResult =
        returnString(entry: logLabelResult, listFunction: toTheLast);
    if (cmdBefore != null) {
      cmdBefore();
    }
    textResult = returnString(entry: textResult);
    if (cmdResult != null) {
      cmdResult();
    }
    _randomResult = eventsDaemon();
    logLength = log.length;
    widget.newTextSpanFunc(logLabelResult, textResult, _randomResult);

    // убираем ModalBottomSheet, если оно есть (для экранов с шириной < 600px)
    if (!widget.isLargeScreen) {
      Navigator.of(context).pop();
    }

    Future.delayed(Duration(milliseconds: 100), () {
      // scrollController.animateTo(scrollController.position.maxScrollExtent,
      //     curve: Curves.linear, duration: Duration(milliseconds: 500));
      itemScrollController.scrollTo(
          index: logLength, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    numberOfObjButtons = 0;
    numberOfActButtons = 0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      constraints: BoxConstraints(
        maxWidth: 800,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Spacer(flex: 1),
          Flexible(
            flex: 10,
            fit: FlexFit.tight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: objects
                  .where((o) =>
                      (o.scenes.contains(currentScene.id) || o.scenes.isEmpty))
                  .map(
                (objData) {
                  if (!objData.hidden) {
                    numberOfObjButtons++;
                    return RaisedButton(
                      // textColor: objData == currentObject
                      //     ? Colors.white
                      //     : Theme.of(context).textTheme.bodyText1.color,
                      textColor: Theme.of(context).textTheme.bodyText1.color,
                      color: objData == currentObject
                          ? Theme.of(context).accentColor
                          : Colors.white,
                      child: Text(
                        capitalize(objData.name),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => _fillActionsColumn(objData),
                    );
                  } else {
                    return SizedBox(
                      height: 0,
                      width: 10,
                    );
                  }
                },
              ).toList(),
            ),
          ),
          Spacer(flex: 1),
          currentObject != null
              ? Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: currentObject.actions.map((actionData) {
                      bool pass = false;
                      bool perpetual = false;
                      if (actionData['flags'] == null) {
                        perpetual = true;
                      } else {
                        if (actionData['flags']()) {
                          pass = true;
                        }
                      }
                      if (pass || perpetual) {
                        numberOfActButtons++;
                        return RaisedButton(
                          textColor:
                              Theme.of(context).textTheme.bodyText1.color,
                          color: Colors.white,
                          child: Text(
                            '${returnString(entry: actionData['label'], listFunction: toTheLast)}',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () => _showActionsResult(
                            logLabelResult: actionData['logLabel'],
                            textResult: actionData['text'],
                            cmdBefore: actionData['actsBefore'],
                            cmdResult: actionData['acts'],
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    }).toList(),
                  ),
                )
              : Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: Text(''),
                ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}

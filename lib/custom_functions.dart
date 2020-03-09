import 'package:flutter/material.dart';

import './init.dart';
import './models/game_object.dart';
import './story/objects.dart';

// Возвращает строку из всего, что подаётся на вход
String returnString({dynamic entry, Function listFunction}) {
  dynamic _temp;
  // Если на входе — функция, возвращаем её результат.
  if (entry is Function) {
    return entry();
  }
  // Если на входе — список, обрабатываем его либо функцией во 2-м параметре, либо перебором по-умолчанию.
  // Если после обработки функцией вернулась не строка, то результат ещё раз обрабатываем через returnString.
  else if (entry is List) {
    if (listFunction != null) {
      _temp = listFunction(entry);
    } else {
      _temp = toTheLast(entry);
    }
    if (!(_temp is String)) {
      return returnString(entry: _temp);
    } else {
      return _temp;
    }
  }
  // Если на входе — TextSpan, возвращаем его текст.
  else if (entry is TextSpan) {
    return entry.text;
  }
  // Если на входе — строка, возвращаем её.
  else {
    return entry;
  }
}

// Возвращает по очереди каждый член списка, пока не остаётся последний.
toTheLast(List lst) {
  if (lst.isEmpty) return null;
  var _temp = lst[0];
  if (lst.length > 1) {
    lst.removeAt(0);
  }
  return _temp;
}

// Возвращает объект из списка объектов по его id
// GameObject objById(String id) {
//   return objects.firstWhere((e) => e.id == id);
// }

// Удаляет объект из списка объектов (если он там есть). Если этот объект в фокусе, сбрасывает фокус.
void removeObject(GameObject obj) {
  var _tempObj = obj;
  if (currentObject == _tempObj) {
    currentObject = GameObject();
  }
  if (objects.contains(_tempObj)) {
    objects.remove(_tempObj);
  }
}

// Демон событий. Разбирает глобальные/локальные/объектные события из переменной events и формирует из нb[] один TextSpan.
List eventsDaemon() {
  List<TextSpan> _allEventsTxt = [];
  _allEventsTxt = [
    ...addEventTxt(events['objectEvents']),
    ...addEventTxt(events['localEvents']),
    ...addEventTxt(events['globalEvents']),
  ];
  return _allEventsTxt;
}

List addEventTxt(List listOfEvents) {
  List<TextSpan> _returnEventsTxt = [];
  dynamic _eventTxt;
  for (var event in listOfEvents) {
    _eventTxt = returnString(entry: event);
    if (_eventTxt is String) {
      _returnEventsTxt.add(
        TextSpan(
          style: currentThemeData.textTheme.bodyText1.copyWith(
            fontStyle: FontStyle.italic,
          ),
          text: _eventTxt,
        ),
      );
    }
  }
  for (var event in eventsToRemove) {
    listOfEvents.remove(event);
  }
  eventsToRemove.clear();
  return _returnEventsTxt;
}

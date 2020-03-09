import 'package:flutter/material.dart';

// Поведение скролла, обнуляющее эффект оверскролла (см. https://www.instagram.com/p/B9bOP8OAlUq/)
class EmptyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

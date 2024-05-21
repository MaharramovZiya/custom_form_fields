import 'package:flutter/material.dart';

class CustomAppSized {
  static late double customHeight;
  static late double customWidth;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    customHeight = mediaQuery.size.height;
    customWidth = mediaQuery.size.width;
  }
}

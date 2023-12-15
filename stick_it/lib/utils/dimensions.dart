import 'package:flutter/material.dart';

Map<String, double> findSizes(BuildContext context) {
  // Get the size of the screen
  Size screenSize = MediaQuery.of(context).size;

  // Access width and height
  double width = screenSize.width;
  double height = screenSize.height;

  double canvasWidth = width - width / 7;
  double halfWidth = (canvasWidth / 2) - 5;
  double buttonHeight = height - canvasWidth;

  // Create and return a Map
  Map<String, double> sizeMap = {
    'width': width,
    'height': height,
    'canvasWidth': canvasWidth,
    'halfWidth': halfWidth,
    'buttonHeight': buttonHeight
  };
  return sizeMap;
}

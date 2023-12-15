import 'package:flutter/material.dart';

Map<String, double> findSizes(BuildContext context) {
  // Get the size of the screen
  Size screenSize = MediaQuery.of(context).size;

  // Access width and height
  double width = screenSize.width;
  double height = screenSize.height;

  double canvasWidth = width -
      width /
          7; //maximum width of objects capsules, text containers, and drawing scene
  double halfWidth = (canvasWidth / 2) - 5;
  double picSize = (canvasWidth / 3) - 20;
  double brushContainerSize = height / 5;
  double spacing = height * 0.035;
  double buttonSpacing =
      (height - brushContainerSize - canvasWidth - (spacing * 2) - 100) / 2;

  // Create and return a Map
  Map<String, double> sizeMap = {
    'width': width,
    'height': height,
    'canvasWidth': canvasWidth,
    'halfWidth': halfWidth,
    'buttonSpacing': buttonSpacing,
    'picSize': picSize,
    'brushContainerSize': brushContainerSize,
    'spacing': spacing
  };
  return sizeMap;
}

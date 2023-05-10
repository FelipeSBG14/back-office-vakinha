import 'package:flutter/cupertino.dart';

extension SizeExtension on BuildContext {
  double get screenWidht => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;
  double get screenLongestSide => MediaQuery.of(this).size.longestSide;

  double percentWidht(double percent) => screenWidht * percent;
  double percentHeight(double percent) => screenHeight * percent;
}

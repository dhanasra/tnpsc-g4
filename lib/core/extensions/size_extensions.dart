import 'package:flutter/material.dart';

extension SizeExtension on num {
  /// Height Space
  SizedBox get h =>
      SizedBox(height: toDouble());

  /// Width Space
  SizedBox get w =>
      SizedBox(width: toDouble());

  /// All Padding
  EdgeInsets get a =>
      EdgeInsets.all(toDouble());

  /// Horizontal Padding
  EdgeInsets get hp =>
      EdgeInsets.symmetric(
        horizontal: toDouble(),
      );

  /// Vertical Padding
  EdgeInsets get vp =>
      EdgeInsets.symmetric(
        vertical: toDouble(),
      );

  /// Circular Radius
  BorderRadius get r =>
      BorderRadius.circular(toDouble());
}
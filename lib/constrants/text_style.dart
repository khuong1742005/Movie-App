import 'package:flutter/material.dart';

TextTheme textTheme() {
  return const TextTheme(
    // Heading lớn nhất
    headlineLarge: TextStyle(
      fontSize: 37,
      fontWeight: FontWeight.bold,
    ),
    // Heading vừa
    headlineMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    // Heading nhỏ
    // Body lon
    bodyLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    // Body vua
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    // Label lon
    labelLarge: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
    ),
    // Label vua
    labelMedium: TextStyle(
      fontSize: 13,
    ),
  );
}

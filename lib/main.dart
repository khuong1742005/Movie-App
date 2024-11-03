import 'package:flutter/material.dart';
import 'package:movie_app/constrants/color_style.dart';
import 'package:movie_app/constrants/text_style.dart';
import 'package:movie_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorTheme(),
        textTheme: textTheme(),
      ),
      home: const WelcomePage(),
    );
  }
}

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue, brightness: Brightness.light),
  appBarTheme: AppBarTheme(color: Colors.blue, titleTextStyle: TextStyle(color: Colors.white)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          foregroundColor: MaterialStateProperty.all(Colors.white))),
  // brightness: Brightness.light
);

ThemeData darkTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
  appBarTheme: AppBarTheme(color: Colors.blue, titleTextStyle: TextStyle(color: Colors.black)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(Colors.black))),
  // brightness: Brightness.dark
);

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue, brightness: Brightness.light),
  appBarTheme: const AppBarTheme(color: Colors.blue, titleTextStyle: TextStyle(color: Colors.white)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.black),
          foregroundColor: WidgetStateProperty.all(Colors.white))),
  // brightness: Brightness.light
);

ThemeData darkTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
  appBarTheme: const AppBarTheme(color: Colors.blue, titleTextStyle: TextStyle(color: Colors.black)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          foregroundColor: WidgetStateProperty.all(Colors.black))),
  // brightness: Brightness.dark
);

import 'dart:ui';
import 'package:flutter/material.dart';

TextStyle boldItalicStyle() {
  return TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic
  );
}

TextStyle customFontStyle() {
  return TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontFamily: 'Schyler'
  );
}
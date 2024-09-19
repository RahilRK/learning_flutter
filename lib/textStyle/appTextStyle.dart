import 'package:flutter/material.dart';

TextStyle boldItalicStyle() {
  return const TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic
  );
}

TextStyle customFontStyle() {
  return const TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontFamily: 'Schyler'
  );
}